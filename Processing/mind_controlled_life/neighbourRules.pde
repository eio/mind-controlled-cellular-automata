int life(int k, int j, int i) {
  if (initGen[k][j][i] == true){
    return 1;
  } else{
    return 0;
  }
}

void updateWorld(int k, int j, int i) {
  int neighbours = 0;
  neighbours += life(k  ,j  ,i  );
  neighbours += life(k  ,j  ,i-1);
  neighbours += life(k  ,j  ,i+1);
  neighbours += life(k  ,j-1,i  );
  neighbours += life(k  ,j-1,i-1);
  neighbours += life(k  ,j-1,i+1);
  neighbours += life(k  ,j+1,i  );
  neighbours += life(k  ,j+1,i-1);
  neighbours += life(k  ,j+1,i+1);
  neighbours += life(k-1,j  ,i  );
  neighbours += life(k-1,j  ,i-1);
  neighbours += life(k-1,j  ,i+1);
  neighbours += life(k-1,j-1,i  );
  neighbours += life(k-1,j-1,i-1);
  neighbours += life(k-1,j-1,i+1);
  neighbours += life(k-1,j+1,i  );
  neighbours += life(k-1,j+1,i-1);
  neighbours += life(k-1,j+1,i+1);
  neighbours += life(k+1,j  ,i  );
  neighbours += life(k+1,j  ,i-1);
  neighbours += life(k+1,j  ,i+1);
  neighbours += life(k+1,j-1,i  );
  neighbours += life(k+1,j-1,i-1);
  neighbours += life(k+1,j-1,i+1);
  neighbours += life(k+1,j+1,i  );
  neighbours += life(k+1,j+1,i-1);
  neighbours += life(k+1,j+1,i+1);
    
  ////////////////////////////////////////
  /////// RULES TO LIVE BY (lol) /////////
  ////////////////////////////////////////

  // 1. one neighbor makes dead cells come to life
  
  if (initGen[k][j][i] == false) {
    if (neighbours == 1) {
      nworldXtGen[k][j][i] = true;
    }
  }

  // 2. two or more neighbours make living cells die
  
  if (initGen[k][j][i] == true) {
    if (neighbours >= 2) {
      nworldXtGen[k][j][i]= false;
    }
  }
}