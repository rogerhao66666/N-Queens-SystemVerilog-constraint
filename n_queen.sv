`define N 8

class n_queen;
  rand int row_pos [`N];
  bit board [`N][`N];
  
  constraint tc {
    
    unique {row_pos};
    
    
    foreach (row_pos[i]) {
      row_pos[i] inside {[0:`N-1]};
    }

      
    foreach (row_pos[i]) {
      foreach (row_pos[j]) {
        if (i!=j) {
          (i-j) != (row_pos[i]-row_pos[j]);
          (i-j) != (row_pos[j]-row_pos[i]);
        }
      }     
    }
  }
          
  function void post_randomize();
      for (int i=0; i<`N; i=i+1) begin
        board[i][row_pos[i]] = 1;
      end
  endfunction
          
  function void print ();
    string s;
    $display("Printing N Queens");
    foreach (board[i]) begin
      s = "";
      foreach (board[i][j]) begin
        s = {s, " ", $sformatf("%0d",board[i][j])};
      end
      $display(" %s",s);
    end
  endfunction
 
endclass
        
        
module automatic test;
  function void run();
    n_queen m_n_queen = new();
    for (int i=0; i<1; i=i+1) begin
      $display ("RANDOMIZE %0d", i);
      m_n_queen.randomize();
      m_n_queen.print();
    end
  endfunction
  initial begin
    run();
  end
endmodule