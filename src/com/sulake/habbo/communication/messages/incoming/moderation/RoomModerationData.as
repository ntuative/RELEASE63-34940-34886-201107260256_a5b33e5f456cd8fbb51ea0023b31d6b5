package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_386:int;
      
      private var var_2396:int;
      
      private var var_2720:Boolean;
      
      private var var_2683:int;
      
      private var _ownerName:String;
      
      private var var_127:RoomData;
      
      private var var_824:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_386 = param1.readInteger();
         this.var_2396 = param1.readInteger();
         this.var_2720 = param1.readBoolean();
         this.var_2683 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_127 = new RoomData(param1);
         this.var_824 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_127 != null)
         {
            this.var_127.dispose();
            this.var_127 = null;
         }
         if(this.var_824 != null)
         {
            this.var_824.dispose();
            this.var_824 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_386;
      }
      
      public function get userCount() : int
      {
         return this.var_2396;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2720;
      }
      
      public function get ownerId() : int
      {
         return this.var_2683;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_127;
      }
      
      public function get event() : RoomData
      {
         return this.var_824;
      }
   }
}
