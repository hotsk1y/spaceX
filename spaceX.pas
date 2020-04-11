unit spaceX;
interface

uses ABCobjects, GraphABC;
var 
Player1, subject: PictureABC;
PlayerSpeed, player_x, player_y, obj_x, obj_y, count: integer;

procedure obj_generator;
procedure point_counter(count_points:integer);
procedure clash;
procedure KeyD(Key: integer);
procedure CreatePlayer(PlayerImg: PictureABC; x_play, y_play, speed: integer);
procedure CreateObject(ObjImg: PictureABC; pos_x, pos_y: integer);
procedure play_window;
procedure EndGame;

implementation

procedure obj_generator;
begin
  obj_x:=random(550);
  obj_y:=random(350)+50;
end;

procedure point_counter(count_points:integer);
begin
SetBrushColor(clwhite);
count_points:=count;
SetFontSize(14);
SetFontColor(clblack);
SetFontName('Times New Roman');
textout(605, 11, count);
end;

procedure clash;
begin;
if (Player1.Left+Player1.Width-50 < subject.Left+subject.Width/2) and (Player1.left+Player1.Width-50 > subject.left-subject.Width/2) 
  and (Player1.Top+Player1.Height/2 < subject.Top + subject.Height/2) and (Player1.Top + Player1.Height > subject.Top+subject.Height/2)
  then begin
        inc(count);
        subject.Left:= obj_x;
        subject.Top:= obj_y;
        obj_generator;
        subject.Move();
  end;
  point_counter(count);
end;

procedure KeyD(Key: integer);
begin
  case Key of 
  VK_Right:
  begin
    if (Player1.Left + Player1.Width <= window.Width) then
      begin 
      Player1.ChangePicture('bin/Player.png');
      Player1.Left:= Player1.Left + PlayerSpeed;
      Player1.Move();
      clash;
      end;
      point_counter(count);
      EndGame;
  end;

    VK_Left:
  begin
    if (Player1.Left >= -13) then
      begin 
      Player1.ChangePicture('bin/PlayerLeft.png');
      Player1.Left:= Player1.Left - PlayerSpeed;
      Player1.Move();
      clash;
      end;
      point_counter(count);
      EndGame;
  end;

    VK_Up:
  begin
    if (Player1.Top >= 0) then
      begin 
      Player1.Top:= Player1.Top - PlayerSpeed;
      Player1.Move();
      clash;
      end;
      point_counter(count);
      EndGame;
  end;

    VK_Down:
  begin
    if (Player1.Top + Player1.Height <= window.Height) then
      begin 
      Player1.Top:= Player1.Top + PlayerSpeed;
      Player1.Move();
      clash;
      end;
      point_counter(count);
      EndGame;
    end;
  end;
end;

procedure CreatePlayer(PlayerImg: PictureABC; x_play, y_play, speed: integer);
begin
  PlayerImg:= pictureABC.Create(75,75,'bin/Player.png');
  Player1:= PlayerImg;
  PlayerSpeed:= speed;
  Player1.Left:=Player1.Left+player_x;
  Player1.Top:=Player1.Top+player_y;
  player_x:=x_play;
  player_y:=y_play;
  Player1.Move();
end;

procedure CreateObject(ObjImg: PictureABC; pos_x, pos_y: integer);
begin
  randomize;
  ObjImg:= pictureABC.Create(50,50,'bin/object.png');
  subject:= ObjImg;
  subject.Left:=subject.Left+obj_x;
  subject.Top:=subject.Top+obj_y;
  subject.Move();
end;

procedure play_window;
begin
  randomize();
  player_x:=200;
  player_y:=0;
  window.Width:=640;
  window.Height:=480;
  window.Caption:='spaceX';
  window.Fill('bin/background.png');
  point_counter(count);
  CreatePlayer(Player1,player_x, player_y, PlayerSpeed);
  CreateObject(subject, obj_x, obj_y);
  OnKeyDown:= KeyD;
end;

procedure EndGame;
begin
  if (count = 50) then
  begin
Player1.Destroy;
subject.Destroy;
window.Clear;
SetWindowPos(550,150);
SetWindowWidth(640);
SetWindowHeight(480);
SetWindowCaption('YOU WIN');
clearwindow;
FillWindow('bin/End.png'); 
end;
end;

end.