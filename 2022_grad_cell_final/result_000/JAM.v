module JAM (
input CLK,
input RST,
output reg [2:0] W,
output reg [2:0] J,
input [6:0] Cost,
output reg [3:0] MatchCount,
output reg [9:0] MinCost,
output reg Valid );


reg [ 2:0] ns, cs;
reg [ 2:0] i;			//w_j  counter
reg [ 2:0] w_j [0:7];
reg [15:0] cnt;			//cycle count
reg [ 9:0] acc;			//accumulator
reg        cost_done, next_done, change1_done, change2_done;
reg        acc_en;
reg [ 2:0] compare;
reg [ 2:0] n, m, index;           //next count

parameter IDLE   = 3'b000;
parameter COST   = 3'b001;
parameter COMP   = 3'b010;
parameter NEXT   = 3'b011;
parameter CHANGE1 = 3'b100;
parameter CHANGE2 = 3'b101;
parameter DONE   = 3'b110;

always@(posedge CLK)begin
	if(RST)
		cs <= IDLE;
	else
		cs <= ns;
end

always@(*)begin
		case(cs)
			IDLE:begin
			         ns = COST;
			     end
			COST:begin
			     	if (cost_done) ns = COMP;
				    else ns = COST;
			     end
			COMP:begin
			         if(cnt == 16'd40319)
			             ns = DONE;
			         else
			             ns = NEXT;
			     end
			NEXT:begin
			     	if (next_done) ns = CHANGE1;
				    else ns = NEXT;
			     end
			CHANGE1:begin
			     	if (change1_done) ns = CHANGE2;
				    else ns = CHANGE1;
			       end			     
			CHANGE2:begin
			     	if (change2_done)begin 
			     	       ns = IDLE;
			     	end
				    else ns = CHANGE2;
			       end
			DONE:begin
			         ns = DONE;
			     end
			default: ns = IDLE;
		endcase
end
/*===============================================================================*/
//COST state
always@(*)begin
	if(RST)
		W = 3'd0;
	else if(cs == COST)
		W = i;
	else
		W = 3'd0;
end

always@(*)begin
	if(RST) 
		J = 3'd0;
	else if(cs == COST)
		J = w_j[i];
	else
		J = 3'd0;
end

always@(posedge CLK)begin
	if(RST)
		i <= 3'd0;
	else if(cs == COST)
		i <= i + 3'd1;
	else
		i <= 3'd0;

end

always@(posedge CLK)begin
	if(RST)
		acc <= 10'd0;
	else if(cs == COST && acc_en)
		acc <= Cost + acc;
	else if(ns == NEXT || cs == CHANGE1)
		acc <= acc;
	else 
		acc <= 10'd0;
end

always@(posedge CLK)begin
    if(RST)
        cost_done <= 0;
    else if(i == 3'd7)
        cost_done <= 1;
    else
        cost_done <= 0;
end     

always@(posedge CLK)begin
    if(RST)
        acc_en <= 0;
    else if(cs == COST)begin
        if(ns == COMP)
            acc_en <= 0;
        else
            acc_en <= 1;
    end
    else
        acc_en <= 0;
    
end       
/*===============================================================================*/
//COMP state
always@(posedge CLK)begin
	if(RST)
		MinCost <= 10'd0;
	else if(cs == COMP)begin
	    if(cnt == 0)
	        MinCost <= acc;
	    else
		    if(MinCost > acc)
                MinCost <= acc;
		    else
		        MinCost <= MinCost;
	end
	else
	    MinCost <= MinCost;	
end

always@(posedge CLK)begin
	if(RST)
		MatchCount <= 4'd0;
	else if(cs == COMP)begin
		if(MinCost == acc)
			MatchCount <= MatchCount + 4'd1;
		else if(MinCost > acc)
			MatchCount <= 4'd1;
	   else
	        MatchCount <= MatchCount;
	end
	else
		MatchCount <= MatchCount;
end

/*===============================================================================*/
//NEXT state
always@(posedge CLK)begin
	if(RST)
		cnt <= 16'd0;
	else if(cs == CHANGE2 && ns == IDLE)
		if(cnt < 16'd40320)
			cnt <= cnt + 16'd1;
		else
			cnt <= 16'd0;
	else
		cnt <= cnt;
	
end

always@(posedge CLK)begin
    if(RST)
        n <= 3'd0;
    else if(cs == NEXT)begin
        if(w_j[n-1] < w_j[n])
            n <= n;
        else
            n <= n - 3'd1;    
    end
    else if(cs == CHANGE1 || cs == CHANGE2)
        n <= n;
    else
        n <= 3'd7;    
end

always@(posedge CLK)begin
    if(RST)
        next_done <= 0;
    else if(cs == NEXT)
        if(w_j[n-1] < w_j[n])
            next_done <= 1;
        else
            next_done <= 0;
    else
        next_done <= 0;    
end
/*===============================================================================*/
//CHANGE1 state
always@(posedge CLK)begin
    if(RST)
        m <= 3'd0;
    else if(cs == CHANGE1)begin
        if((m + n) == 7)
            m <= m;
        else
            m <= m + 3'd1;
    end
    else
        m <= 3'd0;
end

always@(posedge CLK)begin
    if(RST)
        compare <= 3'd0;
    else if(cs == CHANGE1)begin
        if((w_j[n+m] - w_j[n-1]) > 0)
            if((w_j[n+m] - w_j[n-1]) > compare)
                if(compare == 3'd0)
                    compare <= (w_j[n+m] - w_j[n-1]);
                else
                    compare <= compare;
            else
                compare <= (w_j[n+m] - w_j[n-1]);
        else
            compare <= compare;               
    end
    else
        compare <= 3'd0;        
end

always@(posedge CLK)begin
    if(RST)
        index <= 3'd0;
    else if(cs == CHANGE1)begin
        if((w_j[n+m] - w_j[n-1]) > compare)
            index <= index;
        else
            index <= m;
    end
    else if(cs == CHANGE2)begin
        index <= index;
    end
    else
        index <= 3'd0;   
end

always@(posedge CLK)begin
    if(RST)
        change1_done <= 0;
    else if(cs == CHANGE1)begin
        if((m+n)==7)
            change1_done <= 1;
        else     
            change1_done <= 0;  
    end
    else
        change1_done <= 0; 
end


/*===============================================================================*/
//CHANGE2 state



/*===============================================================================*/
reg [ 2:0] c_last, c;
always@(posedge CLK)begin
    if(RST)
        c_last <= 3'd0;
    else if(cs == CHANGE1 && ns == CHANGE2) begin
       case(n)
        3'd0: c_last <= 3'd4;
        3'd1: c_last <= 3'd4;
        3'd2: c_last <= 3'd3;
        3'd3: c_last <= 3'd3;
        3'd4: c_last <= 3'd2;
        3'd5: c_last <= 3'd2;
        3'd6: c_last <= 3'd0;
        3'd7: c_last <= 3'd0;
        default: c_last <= 3'd0;
       endcase 
    end
    else
        c_last <= c_last;
end

always@(posedge CLK)begin
    if(RST)
        c <= 3'd0;
    else if(cs == CHANGE2)
        if(c < c_last)
            c <= c + 3'd1;
        else
            c <= 3'd0;
    else
        c <= 3'd0;
end

always@(*)begin
    if(RST)
        change2_done = 0;
    else if(cs == CHANGE2)begin
        if(c_last == 0)
            change2_done = 1;
        else begin
            if(c == c_last -1)
                change2_done = 1;
            else
                change2_done = 0;
        end
    end
    else
        change2_done = 0;
end

always@(posedge CLK)begin
	if(RST)begin
		w_j[0] <= 3'd0;
		w_j[1] <= 3'd1;
		w_j[2] <= 3'd2;
		w_j[3] <= 3'd3;
		w_j[4] <= 3'd4;
		w_j[5] <= 3'd5;
		w_j[6] <= 3'd6;
		w_j[7] <= 3'd7;
	end
	else if(cs == CHANGE1 && ns == CHANGE2)begin
        w_j[n-1] <= w_j[n+index];
        w_j[n+index] <= w_j[n-1];
	end
	else if(cs == CHANGE2 )begin
	    w_j[n+c] <= w_j[7-c];
	    w_j[7-c] <= w_j[n+c];
	end
	else begin
		w_j[0] <= w_j[0];
		w_j[1] <= w_j[1];
		w_j[2] <= w_j[2];
		w_j[3] <= w_j[3];
		w_j[4] <= w_j[4];
		w_j[5] <= w_j[5];
		w_j[6] <= w_j[6];
		w_j[7] <= w_j[7];	
	end
end
/*===============================================================================*/
//DONE state
always@(posedge CLK)begin
    if(RST)
        Valid <= 0;
    else if(cs == DONE)
        Valid <= 1;
    else
        Valid <= 0;
end
endmodule


