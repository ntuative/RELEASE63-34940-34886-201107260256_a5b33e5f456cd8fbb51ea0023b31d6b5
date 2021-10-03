package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetPlayListEditorNowPlayingEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_130:String = "RWPLENPE_USER_PLAY_SONG";
      
      public static const const_140:String = "RWPLENPW_USER_STOP_SONG";
      
      public static const const_107:String = "RWPLENPE_SONG_CHANGED";
       
      
      private var _id:int;
      
      private var var_1258:int;
      
      private var _priority:int;
      
      public function RoomWidgetPlayListEditorNowPlayingEvent(param1:String, param2:int, param3:int, param4:int, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         this._id = param2;
         this.var_1258 = param3;
         this._priority = param4;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get position() : int
      {
         return this.var_1258;
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
   }
}
