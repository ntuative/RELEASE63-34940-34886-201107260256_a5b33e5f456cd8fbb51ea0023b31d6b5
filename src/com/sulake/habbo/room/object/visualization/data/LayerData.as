package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_808:String = "";
      
      public static const const_447:int = 0;
      
      public static const const_523:int = 255;
      
      public static const const_800:Boolean = false;
      
      public static const const_551:int = 0;
      
      public static const const_663:int = 0;
      
      public static const const_414:int = 0;
      
      public static const const_1387:int = 1;
      
      public static const const_1302:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2401:String = "";
      
      private var var_2136:int = 0;
      
      private var var_2584:int = 255;
      
      private var var_2982:Boolean = false;
      
      private var var_2983:int = 0;
      
      private var var_2980:int = 0;
      
      private var var_2981:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2401 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2401;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_2136 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_2136;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2584 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2584;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2982 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2982;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2983 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2983;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2980 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2980;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2981 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2981;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
