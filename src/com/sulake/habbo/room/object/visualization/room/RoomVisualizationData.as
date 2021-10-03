package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_588:WallRasterizer;
      
      private var var_589:FloorRasterizer;
      
      private var var_907:WallAdRasterizer;
      
      private var var_590:LandscapeRasterizer;
      
      private var var_908:PlaneMaskManager;
      
      private var var_850:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_588 = new WallRasterizer();
         this.var_589 = new FloorRasterizer();
         this.var_907 = new WallAdRasterizer();
         this.var_590 = new LandscapeRasterizer();
         this.var_908 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return this.var_850;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_589;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_588;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_907;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_590;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_908;
      }
      
      public function dispose() : void
      {
         if(this.var_588 != null)
         {
            this.var_588.dispose();
            this.var_588 = null;
         }
         if(this.var_589 != null)
         {
            this.var_589.dispose();
            this.var_589 = null;
         }
         if(this.var_907 != null)
         {
            this.var_907.dispose();
            this.var_907 = null;
         }
         if(this.var_590 != null)
         {
            this.var_590.dispose();
            this.var_590 = null;
         }
         if(this.var_908 != null)
         {
            this.var_908.dispose();
            this.var_908 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(this.var_588 != null)
         {
            this.var_588.clearCache();
         }
         if(this.var_589 != null)
         {
            this.var_589.clearCache();
         }
         if(this.var_590 != null)
         {
            this.var_590.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_588.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_589.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_907.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_590.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_908.initialize(_loc11_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_850)
         {
            return;
         }
         this.var_588.initializeAssetCollection(param1);
         this.var_589.initializeAssetCollection(param1);
         this.var_907.initializeAssetCollection(param1);
         this.var_590.initializeAssetCollection(param1);
         this.var_908.initializeAssetCollection(param1);
         this.var_850 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
