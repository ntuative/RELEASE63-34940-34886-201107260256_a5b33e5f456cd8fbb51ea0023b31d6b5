package com.sulake.habbo.catalog.recycler
{
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   
   public class PrizeContainer extends PrizeGridItem
   {
       
      
      private var var_2807:String;
      
      private var var_2186:int;
      
      private var var_3012:int;
      
      private var _furnitureData:IFurnitureData;
      
      private var var_3108:PrizeGridItem;
      
      public function PrizeContainer(param1:String, param2:int, param3:IFurnitureData, param4:int)
      {
         super();
         this.var_2807 = param1;
         this.var_2186 = param2;
         this._furnitureData = param3;
         this.var_3012 = param4;
      }
      
      public function setIcon(param1:IRoomEngine) : void
      {
         if(param1 == null || this._furnitureData == null)
         {
            return;
         }
         initProductIcon(param1,this._furnitureData.type,this.var_2186);
      }
      
      public function get productItemType() : String
      {
         return this.var_2807;
      }
      
      public function get productItemTypeId() : int
      {
         return this.var_2186;
      }
      
      public function get gridItem() : PrizeGridItem
      {
         return this.var_3108;
      }
      
      public function get oddsLevelId() : int
      {
         return this.var_3012;
      }
      
      public function get title() : String
      {
         if(this._furnitureData == null)
         {
            return "";
         }
         return this._furnitureData.title;
      }
   }
}
