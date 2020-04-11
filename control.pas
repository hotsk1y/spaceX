unit control;
interface
uses GraphABC, spaceX;
var volume_color:color;
music_player: boolean;
main_manu_sound: system.Media.SoundPlayer;
procedure about_menu;
procedure MenuKey(Key1: integer);
function diapazon(value, min, max: integer) : boolean;
procedure MouseDown(x,y,mb: integer);
procedure main_menu;
implementation
function diapazon(value, min, max: integer) : boolean;
begin
if(value>=min) and (value<=max) then
diapazon:=true;
end;
procedure MouseDown(x,y,mb: integer);
begin
if (mb =1) and (diapazon(x,90,270) = true) and (diapazon(y,100,140) = true) then
begin
play_window;
end;
  if (mb =1) and (diapazon(x,90,270) = true) and (diapazon(y,180,220) = true) then
begin
about_menu;
end;
  if (mb =1) and (diapazon(x,197,217) = true) and (diapazon(y,285,305) = true) then
    case music_player of 
  true: 
  begin
  main_manu_sound.Stop;
  volume_color:=clred;
  SetBrushColor(volume_color);
  SetPenColor(volume_color); 
  music_player:= false;
  rectangle(197, 285, 217, 305);
  end;
  false: 
  begin
  volume_color:=clgreen;
  main_manu_sound.Play;
  SetBrushColor(volume_color);
  SetPenColor(volume_color);
  music_player:= true;
  rectangle(197, 285, 217, 305);
  end;end;
  Redraw;
  end;
  procedure main_menu;
begin
SetWindowPos(550,150);
SetWindowWidth(350);
SetWindowHeight(400);
SetWindowCaption('SpaceX');

clearwindow;

FillWindow('bin/menu_background.png'); 

{Заполняет содержимое графического окна обоями из файла}
SetPenColor(clPurple); 
SetBrushColor(clMaroon);
rectangle(90,100, 270, 140);
SetFontSize(17);

SetFontColor(clYellow);
SetFontName('CENTURY GOTHIC');
TextOut(107,105,'START GAME'); 
rectangle(90,180, 270, 220);
TextOut(140,185,'ABOUT'); 

SetFontColor(clWhite);
SetPenColor(clgreen); 
SetBrushColor(clgreen);
rectangle(197, 285, 217, 305);

SetPenColor(clPurple); 
SetBrushColor(clMaroon);
SetFontSize(10);
TextOut(140,287,'music');
 OnMouseDown := MouseDown;
end;

procedure MenuKey(Key1: integer);
begin
  case Key1 of 
  VK_ESCAPE:
  begin
    main_menu;
  end;
  end;
end;


procedure about_menu;
begin 

SetWindowPos(550,200);
SetWindowWidth(400);
SetWindowHeight(200);
SetWindowCaption('About');
FillWindow('bin/AboutMenu.png');
OnKeyDown:= MenuKey;
end;
end.