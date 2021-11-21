module mux
(
  input  d0, d1,
  input  sel,
  output y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------

module and_gate_using_mux
(
    input  a,
    input  b,
    output o
);

  // TODO

  // Implement and gate using instance(s) of mux,
  // constants 0 and 1, and wire connections
  
  // we need 2-1 mux -> 4-1 mux since we have function of 2 values and 2^2
  // = 4 possible values
  wire t1, t2;
  mux u0(0, 0, a, t1);
  mux u1(0, 1, a, t2);
  mux u3(t1, t2, b, o);

endmodule

//----------------------------------------------------------------------------

module testbench;

  logic a, b, o;
  int i, j;

  and_gate_using_mux inst (a, b, o);

  initial
    begin
      for (i = 0; i <= 1; i++)
      for (j = 0; j <= 1; j++)
      begin
        a = i;
        b = j;

        # 1;

        $display ("TEST %b & %b = %b", a, b, o);
    
        if (o !== (a & b))
          begin
            $display ("%s FAIL: %h EXPECTED", `__FILE__, a & b);
            $finish;
          end
      end
      
      $display ("%s PASS", `__FILE__);
      $finish;
    end

endmodule
