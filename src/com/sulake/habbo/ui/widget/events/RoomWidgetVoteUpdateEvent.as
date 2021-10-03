package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_172:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_179:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1267:String;
      
      private var var_1645:Array;
      
      private var var_1326:Array;
      
      private var var_2143:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1267 = param2;
         this.var_1645 = param3;
         this.var_1326 = param4;
         if(this.var_1326 == null)
         {
            this.var_1326 = [];
         }
         this.var_2143 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1267;
      }
      
      public function get choices() : Array
      {
         return this.var_1645.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1326.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_2143;
      }
   }
}
