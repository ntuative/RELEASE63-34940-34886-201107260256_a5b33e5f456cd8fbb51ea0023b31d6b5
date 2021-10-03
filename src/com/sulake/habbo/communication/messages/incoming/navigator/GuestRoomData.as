package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_386:int;
      
      private var var_824:Boolean;
      
      private var var_1022:String;
      
      private var _ownerName:String;
      
      private var var_2321:int;
      
      private var var_2396:int;
      
      private var var_2953:int;
      
      private var var_1942:String;
      
      private var var_2949:int;
      
      private var var_2954:Boolean;
      
      private var var_823:int;
      
      private var var_1696:int;
      
      private var var_2951:String;
      
      private var var_945:Array;
      
      private var var_2950:RoomThumbnailData;
      
      private var var_2315:Boolean;
      
      private var var_2952:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_945 = new Array();
         super();
         this.var_386 = param1.readInteger();
         this.var_824 = param1.readBoolean();
         this.var_1022 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2321 = param1.readInteger();
         this.var_2396 = param1.readInteger();
         this.var_2953 = param1.readInteger();
         this.var_1942 = param1.readString();
         this.var_2949 = param1.readInteger();
         this.var_2954 = param1.readBoolean();
         this.var_823 = param1.readInteger();
         this.var_1696 = param1.readInteger();
         this.var_2951 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_945.push(_loc4_);
            _loc3_++;
         }
         this.var_2950 = new RoomThumbnailData(param1);
         this.var_2315 = param1.readBoolean();
         this.var_2952 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_386;
      }
      
      public function get event() : Boolean
      {
         return this.var_824;
      }
      
      public function get roomName() : String
      {
         return this.var_1022;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2321;
      }
      
      public function get userCount() : int
      {
         return this.var_2396;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2953;
      }
      
      public function get description() : String
      {
         return this.var_1942;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2949;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2954;
      }
      
      public function get score() : int
      {
         return this.var_823;
      }
      
      public function get categoryId() : int
      {
         return this.var_1696;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2951;
      }
      
      public function get tags() : Array
      {
         return this.var_945;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2950;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2315;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2952;
      }
   }
}
