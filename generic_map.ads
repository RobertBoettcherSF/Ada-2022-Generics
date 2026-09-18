--  Generic function: map an array using a formal operator.
pragma Ada_2022;

generic
   type Index is (<>);
   type Elem is private;
   type Arr is array (Index range <>) of Elem;
   with function Op (X : Elem) return Elem;
function Generic_Map (A : Arr) return Arr;
