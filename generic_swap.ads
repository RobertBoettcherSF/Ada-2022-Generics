--  Ada 2022 topic: generic procedure (formal private type).
pragma Ada_2022;

generic
   type Elem is private;
procedure Generic_Swap (A, B : in out Elem);
