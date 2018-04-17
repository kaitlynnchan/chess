void drawIntro() {
  reset();
  image(chessbackground, -75, 0, 1050, height);
  fill(0);
  stroke(0);
  ellipse(450, height/2, 100, 100);
  fill(255);
  textSize(70);
  text("Chess", 360, 200);
  textSize(35);
  text("Play", 420, height/2 + 10);
}

void drawChoose() {
  image(chessbackground, -75, 0, 1050, height);

  fill(255);
  textSize(50);
  text("Choose your Player", 240, 250);
  image(bpiece, 200, 315, 100, 225);
  image(wpiece, 600, 315, 100, 225);
}

void drawWaiting() {
  image(chessbackground, -75, 0, 1050, height);
  fill(255);
  textSize(35);
  text("Waiting for opponent to choose their team", 50, height/2 + 10);
}
void drawPlay() {
  int r = 0;
  int c = 0;
  while (r < 8) {
    //setup
    if (board[r][c] == EMPTY) {
    }
    if (board[r][c] == bp) {
      image(bppic, c*100, r*100, 100, 100);
    }
    if (board[r][c] == br) {
      image(brpic, c*100, r*100, 100, 100);
    }
    if (board[r][c] == bn) {
      image(bnpic, c*100, r*100, 100, 100);
    }
    if (board[r][c] == bb) {
      image(bbpic, c*100, r*100, 100, 100);
    }
    if (board[r][c] == bq) {
      image(bqpic, c*100, r*100, 100, 100);
    }
    if (board[r][c] == bK) {
      image(bKpic, c*100, r*100, 100, 100);
    }

    if (board[r][c] == wp) {
      image(wppic, c*100, r*100, 100, 100);
    }
    if (board[r][c] == wr) {
      image(wrpic, c*100, r*100, 100, 100);
    }
    if (board[r][c] == wn) {
      image(wnpic, c*100, r*100, 100, 100);
    }
    if (board[r][c] == wb) {
      image(wbpic, c*100, r*100, 100, 100);
    }
    if (board[r][c] == wq) {
      image(wqpic, c*100, r*100, 100, 100);
    }
    if (board[r][c] == wK) {
      image(wKpic, c*100, r*100, 100, 100);
    }

    if (board[r][c] == hl) {
      fill(#FF0000, 100);
      noStroke();
      rect(c * 100, r / 200, 100, 100);
      rect(c * 100, r / 300, 100, 100);
    }

    c++;
    if (c > 7) {
      c = 0;
      r++;
    }
  }
  fill(0);
  rect(810, 178, 80, 35);
  fill(255);
  text("Done", 826, 203);

  fill(0);
  rect(810, 680, 80, 35);
  fill(255);
  text("Home", 823, 703);

  fill(0);
  rect(810, 725, 80, 35);
  fill(255);
  text("Reset", 824, 748);

}

void nextTurn() {
  textSize(20);
  if (turn == 0) {
    fill(#26D600);
    text("Your Turn", 808, 50);
  }
  if (turn == 1) {
    fill(#FC0516);
    text("Waiting", 805, 50);
    text("for", 805, 75);
    text("opponent", 805, 100);
    text("...", 805, 125);
  }
}

void reset() {
  if (wORb == 2) {
    turn = 0;
  }
  if (wORb == 1) {
    turn = 1;
  }
  board[0][0] = br;
  board[0][1] = bn;
  board[0][2] = bb;
  board[0][3] = bq;
  board[0][4] = bK;
  board[0][5] = bb;
  board[0][6] = bn;
  board[0][7] = br;

  board[1][0] = bp;
  board[1][1] = bp;
  board[1][2] = bp;
  board[1][3] = bp;
  board[1][4] = bp;
  board[1][5] = bp;
  board[1][6] = bp;
  board[1][7] = bp;

  board[2][0] = EMPTY;
  board[2][1] = EMPTY;
  board[2][2] = EMPTY;
  board[2][3] = EMPTY;
  board[2][4] = EMPTY;
  board[2][5] = EMPTY;
  board[2][6] = EMPTY;
  board[2][7] = EMPTY;

  board[3][0] = EMPTY;
  board[3][1] = EMPTY;
  board[3][2] = EMPTY;
  board[3][3] = EMPTY;
  board[3][4] = EMPTY;
  board[3][5] = EMPTY;
  board[3][6] = EMPTY;
  board[3][7] = EMPTY;

  board[4][0] = EMPTY;
  board[4][1] = EMPTY;
  board[4][2] = EMPTY;
  board[4][3] = EMPTY;
  board[4][4] = EMPTY;
  board[4][5] = EMPTY;
  board[4][6] = EMPTY;
  board[4][7] = EMPTY;

  board[5][0] = EMPTY;
  board[5][1] = EMPTY;
  board[5][2] = EMPTY;
  board[5][3] = EMPTY;
  board[5][4] = EMPTY;
  board[5][5] = EMPTY;
  board[5][6] = EMPTY;
  board[5][7] = EMPTY;

  board[6][0] = wp;
  board[6][1] = wp;
  board[6][2] = wp;
  board[6][3] = wp;
  board[6][4] = wp;
  board[6][5] = wp;
  board[6][6] = wp;
  board[6][7] = wp;

  board[7][0] = wr;
  board[7][1] = wn;
  board[7][2] = wb;
  board[7][3] = wq;
  board[7][4] = wK;
  board[7][5] = wb;
  board[7][6] = wn;
  board[7][7] = wr;
}

void drawGameover() {
}