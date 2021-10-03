package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2634:String;
      
      private var var_2630:int;
      
      private var var_2631:int;
      
      private var var_2632:String;
      
      private var var_2633:int;
      
      private var var_2123:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2634 = param1.readString();
         this.var_2630 = param1.readInteger();
         this.var_2631 = param1.readInteger();
         this.var_2632 = param1.readString();
         this.var_2633 = param1.readInteger();
         this.var_2123 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2634;
      }
      
      public function get unitPort() : int
      {
         return this.var_2630;
      }
      
      public function get worldId() : int
      {
         return this.var_2631;
      }
      
      public function get castLibs() : String
      {
         return this.var_2632;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2633;
      }
      
      public function get nodeId() : int
      {
         return this.var_2123;
      }
   }
}
