pragma Ada_2022;

function Generic_Map (A : Arr) return Arr is
   Result : Arr (A'Range);
begin
   for I in A'Range loop
      Result (I) := Op (A (I));
   end loop;
   return Result;
end Generic_Map;
