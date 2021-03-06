package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1961:Boolean;
      
      private var var_2676:int;
      
      private var var_2674:String;
      
      private var var_386:int;
      
      private var var_2675:int;
      
      private var var_2140:String;
      
      private var var_2673:String;
      
      private var var_2672:String;
      
      private var var_945:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_945 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1961 = false;
            return;
         }
         this.var_1961 = true;
         this.var_2676 = int(_loc2_);
         this.var_2674 = param1.readString();
         this.var_386 = int(param1.readString());
         this.var_2675 = param1.readInteger();
         this.var_2140 = param1.readString();
         this.var_2673 = param1.readString();
         this.var_2672 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_945.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_945 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2676;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2674;
      }
      
      public function get flatId() : int
      {
         return this.var_386;
      }
      
      public function get eventType() : int
      {
         return this.var_2675;
      }
      
      public function get eventName() : String
      {
         return this.var_2140;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2673;
      }
      
      public function get creationTime() : String
      {
         return this.var_2672;
      }
      
      public function get tags() : Array
      {
         return this.var_945;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1961;
      }
   }
}
