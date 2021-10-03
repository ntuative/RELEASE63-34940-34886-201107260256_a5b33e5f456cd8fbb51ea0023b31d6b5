package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomEntryData;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_2101:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_220:MsgWithRequestId;
      
      private var var_658:RoomEventData;
      
      private var var_2576:Boolean;
      
      private var var_2577:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2579:int;
      
      private var var_280:GuestRoomData;
      
      private var var_1001:PublicRoomShortData;
      
      private var var_2582:int;
      
      private var var_2578:Boolean;
      
      private var var_2572:int;
      
      private var var_2573:Boolean;
      
      private var var_1915:int;
      
      private var var_2581:Boolean;
      
      private var var_1527:Array;
      
      private var var_1526:Array;
      
      private var var_2580:int;
      
      private var var_1528:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1243:Boolean;
      
      private var var_2575:int;
      
      private var var_2571:Boolean;
      
      private var var_2574:int = 0;
      
      private var var_1914:OfficialRoomEntryData;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1527 = new Array();
         this.var_1526 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_280 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_280 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_1001 = null;
         this.var_280 = null;
         this._currentRoomOwner = false;
         if(param1.privateRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_1001 = param1.publicSpace;
            this.var_658 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_658 != null)
         {
            this.var_658.dispose();
            this.var_658 = null;
         }
         if(this.var_1001 != null)
         {
            this.var_1001.dispose();
            this.var_1001 = null;
         }
         if(this.var_280 != null)
         {
            this.var_280.dispose();
            this.var_280 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_280 != null)
         {
            this.var_280.dispose();
         }
         this.var_280 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_658 != null)
         {
            this.var_658.dispose();
         }
         this.var_658 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_220 != null && this.var_220 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_220 != null && this.var_220 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_220 != null && this.var_220 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_220 = param1;
         this.var_1914 = param1.ad;
         this.var_1243 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_220 = param1;
         this.var_1243 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_220 = param1;
         this.var_1243 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_220 == null)
         {
            return;
         }
         this.var_220.dispose();
         this.var_220 = null;
      }
      
      public function set adRoom(param1:OfficialRoomEntryData) : void
      {
         this.var_1914 = param1;
      }
      
      public function get adRoom() : OfficialRoomEntryData
      {
         return this.var_1914;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_220 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_220 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_220 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_658;
      }
      
      public function get avatarId() : int
      {
         return this.var_2579;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2576;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2577;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_280;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_1001;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2578;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2572;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1915;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2573;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2575;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2582;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2581;
      }
      
      public function get adIndex() : int
      {
         return this.var_2574;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2571;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2579 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2572 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2578 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2576 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2577 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2573 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1915 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2575 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2582 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2581 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2574 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2571 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1527 = param1;
         this.var_1526 = new Array();
         for each(_loc2_ in this.var_1527)
         {
            if(_loc2_.visible)
            {
               this.var_1526.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1527;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1526;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2580 = param1.limit;
         this.var_1528 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1528 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_280.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_280 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_280.flatId;
         return this.var_1915 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1528 >= this.var_2580;
      }
      
      public function startLoading() : void
      {
         this.var_1243 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1243;
      }
   }
}
