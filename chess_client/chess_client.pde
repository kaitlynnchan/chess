import processing.net.*;

Client myClient;

String myMsg, theirMsg;

final int EMPTY = 0;
final int bp = 1;
final int br = 2;
final int bn = 3;
final int bb = 4;
final int bq = 5;
final int bK = 6;

final int wp = 7;
final int wr = 8;
final int wn = 9;
final int wb = 10;
final int wq = 11;
final int wK = 12;

final int hl = 13;

final int INTRO = 1;
final int CHOOSE = 2;
final int WAITING = 3;
final int PLAY = 4;
final int GAMEOVER = 5;
int mode = INTRO;

int[][] board = {
  {br, bn, bb, bq, bK, bb, bn, br}, 
  {bp, bp, bp, bp, bp, bp, bp, bp}, 
  {EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY}, 
  {EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY}, 
  {EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY}, 
  {EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY}, 
  {wp, wp, wp, wp, wp, wp, wp, wp}, 
  {wr, wn, wb, wq, wK, wb, wn, wr}, 
};

PImage boardpic, bppic, brpic, bnpic, bbpic, bqpic, bKpic, wppic, wrpic, wnpic, wbpic, wqpic, wKpic;
PImage bpiece, wpiece, chessbackground;

int pieceselect = EMPTY;
int clickcount = 0;

int startR;
int startC;
int endR;
int endC;

int wORb = 0; 
int turn = 1; 
int a = 0;
int a2 = 0;

void setup() {
  size(900, 800, FX2D);
  myClient = new Client(this, "127.0.01", 1234);
  boardpic = loadImage("board.png");
  bppic = loadImage("blackpawn.png");
  brpic = loadImage("blackrook.png");
  bnpic = loadImage("blackknight.png");
  bbpic = loadImage("blackbishop.png");
  bqpic = loadImage("blackqueen.png");
  bKpic = loadImage("blackking.png");
  bppic = loadImage("blackpawn.png");

  wppic = loadImage("whitepawn.png");
  wrpic = loadImage("whiterook.png");
  wnpic = loadImage("whiteknight.png");
  wbpic = loadImage("whitebishop.png");
  wqpic = loadImage("whitequeen.png");
  wKpic = loadImage("whiteking.png");

  wpiece = loadImage("whitepiece.png");
  bpiece = loadImage("blackpiece.png");

  chessbackground = loadImage("chess-1.jpg");
}

void draw() {
  //imageMode(CENTER);
  listening();
  image(boardpic, 0, 0, 800, 800);
  fill(#EBC288);
  stroke(#EBC288);
  rect(800, -1, 100, 800);

  if (mode == INTRO) {
    drawIntro();
  } else if (mode == CHOOSE) {
    drawChoose();
  } else if (mode == WAITING) {
    drawWaiting();
  } else if (mode == PLAY) {
    drawPlay();
    nextTurn();
  } else if (mode == GAMEOVER) {
    drawGameover();
  }
}

void listening() {
  if (myClient.available() > 0) {
    theirMsg = myClient.readString();
    String[] coordinates = theirMsg.split(",");
    int StartR = int(coordinates[0]);
    int StartC = int(coordinates[1]);
    int EndR = int(coordinates[2]);
    int EndC = int(coordinates[3]);
    int Turn = int(coordinates[4]);
    if (StartR == 9 && StartC == 9 && EndR == 9 && EndC == 9 && Turn == 0) {// && mode == WAITING
      wORb = 2;
      turn = 0;
      mode = PLAY;
    } else if (StartR == 9 && StartC == 9 && EndR == 9 && EndC == 10 && Turn == 0) {
      wORb = 1;
      turn = 1;
      mode = PLAY;
    } else if (StartR == 9 && StartC == 9 && EndR == 9 && EndC == 11 && Turn == 0) {
      mode = WAITING;
    } else if (StartR == 10 && StartC == 10 && EndR == 10 && EndC == 10 && Turn == 10) {
      reset();
    } else if (StartR == 11 && StartC == 10 && EndR == 10 && EndC == 10 && Turn == 10) {
      mode = INTRO;
    } else if (StartR == 9 && StartC == 9 && EndR == 9 && EndC == 9 && Turn == 1) {
      turn = 0;
    } else if (StartR <= 8 && StartC <= 8 && EndR <= 8 && EndR <= 8 && Turn == 0) {
      board[EndR][EndC] = board[StartR][StartC];
      board[StartR][StartC] = EMPTY;
      //turn = 0;
    }
    println(theirMsg);
  }
}

void mouseReleased() {
  //clicking
  int row = mouseY/100;
  int col = mouseX/100;
  if (mouseY < 800 && mouseX < 800 && mode == PLAY && turn == 0) {// && mode == INTRO  

    //========================================================== if choose black --> black moves 1 == black
    if (wORb == 1) {
      if (board[row][col] != EMPTY && clickcount == 0 && board[row][col] != wp && board[row][col] != wr && board[row][col] != wn && board[row][col] != wb && board[row][col] != wq && board[row][col] != wK) {
        startR = row;
        startC = col;
        clickcount = 1;
      } else if ( clickcount != 0 && board[row][col] != bp && board[row][col] != br && board[row][col] != bn && board[row][col] != bb && board[row][col] != bq && board[row][col] != bK) {
        endR = row;
        endC = col;
        board[endR][endC] = board[startR][startC];
        board[startR][startC] = EMPTY;
        clickcount = 0;
        myClient.write(startR + "," + startC + "," + endR + "," + endC + "," + 0);
      } else if (clickcount != 0 && board[row][col] == board[row][col]) {
        clickcount = 0;
      }
    } else if (wORb == 2) {
      //========================================================== if choose white --> white moves 2 == white
      if (board[row][col] != EMPTY && clickcount == 0 && board[row][col] != bp && board[row][col] != br && board[row][col] != bn && board[row][col] != bb && board[row][col] != bq && board[row][col] != bK) {
        startR = row;
        startC = col;
        clickcount = 1;
      } else if ( clickcount != 0 && board[row][col] != wp && board[row][col] != wr && board[row][col] != wn && board[row][col] != wb && board[row][col] != wq && board[row][col] != wK) {
        endR = row;
        endC = col;
        board[endR][endC] = board[startR][startC];
        board[startR][startC] = EMPTY;
        clickcount = 0;
        myClient.write(startR + "," + startC + "," + endR + "," + endC + "," + 0);
      } else if (clickcount != 0 && board[row][col] == board[row][col]) {
        clickcount = 0;
      }
    }
  }
  
  if (mode == PLAY) {//==== Waiting
    if (mouseX >= 810 && mouseX <= 890 && mouseY >= 178 && mouseY <= 213) {//done button
      turn = 1;
      myClient.write(9 + "," + 9 + "," + 9 + "," + 9 + "," + 1);
    }
    if (mouseX >= 810 && mouseX <= 890 && mouseY >= 725 && mouseY <= 760) {//reset button
      reset();
      myClient.write(10 + "," + 10 + "," + 10 + "," + 10 + "," + 10);
    }
    if(mouseX >= 810 && mouseX <= 890 && mouseY >= 680 && mouseY <= 715){//home button
      mode = INTRO;
      myClient.write(11 + "," + 10 + "," + 10 + "," + 10 + "," + 10);
    }
  }
  if (mode == INTRO) {//==== press play --> choose
    if (dist(mouseX, mouseY, width/2, height/2) < 50) {
      mode = CHOOSE;
      myClient.write(9 + "," + 9 + "," + 9 + "," + 11 + "," + 0);
    }
  }

  if (mode == CHOOSE) {
    if (mouseX >= 200 && mouseX <= 300 && mouseY >= 315 && mouseY <= 540) {//==== chosen black
      wORb = 1;
      turn = 1;
      mode = PLAY;
      myClient.write(9 + "," + 9 + "," + 9 + "," + 9 + "," + 0);
    }
    if (mouseX >= 600 && mouseX <= 700 && mouseY >= 315 && mouseY <= 540) {//==== chosen white
      wORb = 2;
      turn = 0;
      mode = PLAY;
      myClient.write(9 + "," + 9 + "," + 9 + "," + 10 + "," + 0);
    }
  }
}