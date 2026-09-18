--  Generic package: bounded stack over a formal element type.
pragma Ada_2022;

generic
   type Elem is private;
   Capacity : Positive;
package Generic_Stack is

   type Stack is limited private;

   procedure Clear (S : in out Stack);
   procedure Push (S : in out Stack; Item : Elem);
   procedure Pop (S : in out Stack; Item : out Elem);
   function Length (S : Stack) return Natural;
   function Is_Empty (S : Stack) return Boolean;
   function Is_Full (S : Stack) return Boolean;

   Stack_Empty : exception;
   Stack_Full  : exception;

private

   type Store is array (1 .. Capacity) of Elem;
   type Stack is record
      Data  : Store;
      Top   : Natural := 0;
   end record;

end Generic_Stack;
