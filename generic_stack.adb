pragma Ada_2022;

package body Generic_Stack is

   procedure Clear (S : in out Stack) is
   begin
      S.Top := 0;
   end Clear;

   procedure Push (S : in out Stack; Item : Elem) is
   begin
      if S.Top >= Capacity then
         raise Stack_Full;
      end if;
      S.Top := S.Top + 1;
      S.Data (S.Top) := Item;
   end Push;

   procedure Pop (S : in out Stack; Item : out Elem) is
   begin
      if S.Top = 0 then
         raise Stack_Empty;
      end if;
      Item := S.Data (S.Top);
      S.Top := S.Top - 1;
   end Pop;

   function Length (S : Stack) return Natural is
   begin
      return S.Top;
   end Length;

   function Is_Empty (S : Stack) return Boolean is
   begin
      return S.Top = 0;
   end Is_Empty;

   function Is_Full (S : Stack) return Boolean is
   begin
      return S.Top = Capacity;
   end Is_Full;

end Generic_Stack;
