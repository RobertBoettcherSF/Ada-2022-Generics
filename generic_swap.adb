pragma Ada_2022;

procedure Generic_Swap (A, B : in out Elem) is
   Tmp : constant Elem := A;
begin
   A := B;
   B := Tmp;
end Generic_Swap;
