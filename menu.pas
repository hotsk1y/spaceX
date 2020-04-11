uses GraphABC, System.Media, control, spaceX;

begin
music_player:= true;
main_manu_sound:= new system.Media.SoundPlayer;
  main_manu_sound.SoundLocation:='bin/Tommee Profitt - In The End.wav';
  main_manu_sound.Play;
  count:=0;
  obj_generator;
  volume_color:=clgreen;
  main_menu;
  PlayerSpeed:=10;
end.

