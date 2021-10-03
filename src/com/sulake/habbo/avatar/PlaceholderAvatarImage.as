package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_859:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1156)
         {
            _structure = null;
            _assets = null;
            var_305 = null;
            var_316 = null;
            var_667 = null;
            var_612 = null;
            var_362 = null;
            if(!var_1433 && var_48)
            {
               var_48.dispose();
            }
            var_48 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_803 = null;
            var_1156 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_859[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_859[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_445:
               switch(_loc3_)
               {
                  case AvatarAction.const_832:
                  case AvatarAction.const_564:
                  case AvatarAction.const_441:
                  case AvatarAction.const_771:
                  case AvatarAction.const_437:
                  case AvatarAction.const_1037:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_369:
            case AvatarAction.const_157:
            case AvatarAction.const_293:
            case AvatarAction.const_840:
            case AvatarAction.const_865:
            case AvatarAction.const_1009:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
