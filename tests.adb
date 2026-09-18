pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Generic_Swap;
with Generic_Stack;
with Generic_Map;

procedure Tests is

   procedure Swap_Int is new Generic_Swap (Elem => Integer);
   procedure Swap_Char is new Generic_Swap (Elem => Character);

   package Int_Stack is new Generic_Stack (Elem => Integer, Capacity => 3);

   type Int_Arr is array (Positive range <>) of Integer;

   function Double (X : Integer) return Integer is (X * 2);

   function Map_Double is new Generic_Map
     (Index => Positive,
      Elem  => Integer,
      Arr   => Int_Arr,
      Op    => Double);

   X, Y : Integer := 1;
   C1   : Character := 'a';
   C2   : Character := 'z';
   S    : Int_Stack.Stack;
   Item : Integer;
   A    : constant Int_Arr := [1, 2, 3];
   B    : Int_Arr (1 .. 3);
begin
   Int_Stack.Clear (S);

   Y := 2;
   Swap_Int (X, Y);
   Assert (X = 2 and then Y = 1);
   Swap_Char (C1, C2);
   Assert (C1 = 'z' and then C2 = 'a');
   Put_Line ("PASS generic procedure Swap");

   Assert (Int_Stack.Is_Empty (S));
   Int_Stack.Push (S, 10);
   Int_Stack.Push (S, 20);
   Assert (Int_Stack.Length (S) = 2);
   Assert (not Int_Stack.Is_Full (S));
   Int_Stack.Push (S, 30);
   Assert (Int_Stack.Is_Full (S));
   begin
      Int_Stack.Push (S, 40);
      Assert (False, "expected Stack_Full");
   exception
      when Int_Stack.Stack_Full =>
         null;
   end;
   Int_Stack.Pop (S, Item);
   Assert (Item = 30);
   Int_Stack.Clear (S);
   Assert (Int_Stack.Is_Empty (S));
   begin
      Int_Stack.Pop (S, Item);
      Assert (False, "expected Stack_Empty");
   exception
      when Int_Stack.Stack_Empty =>
         null;
   end;
   Put_Line ("PASS generic package Stack");

   B := Map_Double (A);
   Assert (B = Int_Arr'[2, 4, 6]);
   Put_Line ("PASS generic function Map + formal subprogram");

   Put_Line ("All Generics topic tests passed.");
end Tests;
