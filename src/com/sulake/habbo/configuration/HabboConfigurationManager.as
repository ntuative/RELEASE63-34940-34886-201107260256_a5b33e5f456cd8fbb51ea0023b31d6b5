package com.sulake.habbo.configuration
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.TextAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.configuration.enum.HabboConfigurationFlags;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.Security;
   import flash.utils.Dictionary;
   
   public class HabboConfigurationManager extends Component implements IHabboConfigurationManager
   {
      
      private static var var_1489:String = "%";
       
      
      private var var_849:Dictionary;
      
      private var var_850:Boolean = false;
      
      private var var_686:String = "";
      
      private var var_2031:Array;
      
      public function HabboConfigurationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         this.var_2031 = [];
         super(param1,param2,param3);
         this.var_850 = (param2 & 0) > 0;
         this.var_849 = new Dictionary();
         if(!this.var_850)
         {
            lock();
         }
         var _loc4_:TextAsset = param3.getAssetByName("default_configuration") as TextAsset;
         this.parseConfiguration(_loc4_.content.toString());
         var _loc5_:Stage = param1.displayObjectContainer.stage;
         var _loc6_:String = _loc5_.loaderInfo.url;
         var _loc7_:int = _loc6_.lastIndexOf("/");
         _loc6_ = _loc6_.substring(0,_loc7_ + 1);
         this.setKey("flash.client.url",_loc6_);
         for(_loc8_ in _loc5_.loaderInfo.parameters)
         {
            ErrorReportStorage.addDebugData("Parsing flashvars","Parsing flasvars");
            _loc9_ = _loc5_.loaderInfo.parameters[_loc8_];
            _loc8_ = _loc8_.replace(/[_]/g,".");
            Logger.log("Habbo Configuration: Register HTML Parameter: " + _loc8_ + " = " + _loc9_);
            this.setKey(_loc8_,_loc9_,true);
         }
         ErrorReportStorage.addDebugData("Flashvars/host","Host: " + this.getKey("connection.info.host","not found!"));
         ErrorReportStorage.addDebugData("Flashvars/port","Port: " + this.getKey("connection.info.port","not found!"));
         this.var_686 = this.getKey("url_prefix");
         if(this.var_686 != null && this.var_686.length > 0)
         {
            this.setKey("client.fatal.error.url",this.var_686 + "/flash_client_error");
         }
         this.init();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      private function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!this.var_850)
         {
            _loc1_ = this.getKey("external.variables.txt","external_variables.txt");
            Logger.log("Configuration External Variables: " + _loc1_);
            if(assets.hasAsset(_loc1_))
            {
               Logger.log("[HabboConfigurationManager] reload configuration for url: " + _loc1_);
            }
            _loc2_ = new URLRequest(_loc1_);
            _loc3_ = assets.loadAssetFromFile(_loc1_,_loc2_,"text/plain");
            _loc3_.addEventListener(AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE,this.method_6);
            _loc3_.addEventListener(AssetLoaderEvent.const_41,this.onConfigurationError);
         }
      }
      
      private function onConfigurationError(param1:Event = null) : void
      {
         var _loc2_:AssetLoaderEvent = param1 as AssetLoaderEvent;
         var _loc3_:int = 0;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.status;
         }
         HabboWebTools.logEventLog("external_variables download error " + _loc3_);
         Core.error("Could not load external variables. Failed to load URL " + this.getKey("external.variables.txt") + "HTTP status " + _loc3_ + ". Client startup failed!",true,Core.const_1221);
      }
      
      private function method_6(param1:Event = null) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:String = _loc2_.assetLoader.content as String;
         if(_loc3_ != null)
         {
            this.parseConfiguration(_loc3_);
         }
         if(_loc3_ == null || _loc3_.length == 0)
         {
            _loc5_ = _loc3_ != null ? int(_loc3_.length) : -1;
            Core.error("Could not load external variables, got empty data from URL " + this.getKey("external.variables.txt") + " data length = " + _loc5_ + ". Client startup failed!",false,Core.const_1221);
         }
         Logger.log("Configuration check: " + this.getKey("connection.info.host"));
         var _loc4_:String = this.getKey("external.override.variables.txt");
         if(_loc4_ && _loc4_ != "")
         {
            Logger.log("Override External Variables: " + _loc4_);
            if(assets.hasAsset(_loc4_))
            {
               Logger.log("[HabboConfigurationManager] reload configuration for url: " + _loc4_);
            }
            _loc6_ = new URLRequest(_loc4_);
            _loc7_ = assets.loadAssetFromFile(_loc4_,_loc6_,"text/plain");
            _loc7_.addEventListener(AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE,this.onInitConfigurationOverride);
            _loc7_.addEventListener(AssetLoaderEvent.const_41,this.onConfigurationOverrideError);
         }
         else if(!this.var_850)
         {
            this.var_850 = true;
            if(locked)
            {
               unlock();
            }
         }
      }
      
      private function onConfigurationOverrideError(param1:Event) : void
      {
         var _loc2_:AssetLoaderEvent = param1 as AssetLoaderEvent;
         var _loc3_:int = 0;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.status;
         }
         Logger.log("Could not load external variables override. HTTP status: " + _loc3_);
         this.var_850 = true;
         if(locked)
         {
            unlock();
         }
      }
      
      private function onInitConfigurationOverride(param1:Event) : void
      {
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:String = _loc2_.assetLoader.content as String;
         if(_loc3_ != null)
         {
            this.parseConfiguration(_loc3_);
         }
         this.var_850 = true;
         if(locked)
         {
            unlock();
         }
      }
      
      private function parseConfiguration(param1:String) : void
      {
         var line:String = null;
         var pair:Array = null;
         var key:String = null;
         var value:String = null;
         var localKey:String = null;
         var index:int = 0;
         var originalKey:String = null;
         var externalAccessDomain:String = null;
         var portIndex:int = 0;
         var data:String = param1;
         var pattern_rows:RegExp = /\n\r{1,}|\n{1,}|\r{1,}/mg;
         var pattern_trim:RegExp = /^\s+|\s+$/g;
         var rows:Array = data.split(pattern_rows);
         var readOnly:Boolean = false;
         for each(line in rows)
         {
            if(line.substr(0,1) != "#")
            {
               pair = line.split("=");
               if(pair[0].length > 0 && pair[1].length > 0)
               {
                  key = pair.shift();
                  value = pair.join("=");
                  key = key.replace(pattern_trim,"");
                  value = value.replace(pattern_trim,"");
                  if(key == "configuration.readonly" && value == "true")
                  {
                     readOnly = true;
                  }
                  this.setKey(key,value,readOnly);
               }
            }
         }
         if(this.getKey("local.environment") == "true")
         {
            for(localKey in this.var_849)
            {
               index = localKey.indexOf(".local");
               if(index != -1)
               {
                  originalKey = localKey.substring(0,index);
                  this.setKey(originalKey,this.getKey(localKey));
                  Logger.log("Replacing " + originalKey + " with value of " + localKey);
               }
            }
         }
         this.var_686 = this.getKey("url.prefix");
         if(this.var_686.length > 0)
         {
            externalAccessDomain = this.var_686.replace("http://","");
            portIndex = externalAccessDomain.indexOf(":");
            if(portIndex != -1)
            {
               externalAccessDomain = externalAccessDomain.substring(0,portIndex);
            }
            try
            {
               if(this.isValidDomain(externalAccessDomain))
               {
                  Logger.log("Allowing external access from domain: " + externalAccessDomain);
                  Security.allowDomain(externalAccessDomain);
               }
               else
               {
                  Logger.log("Will not allow external access from domain: " + externalAccessDomain);
               }
            }
            catch(e:Error)
            {
            }
         }
      }
      
      private function isValidDomain(param1:String) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:Array = param1.split(".");
         if(_loc2_.length >= 2)
         {
            _loc3_ = _loc2_.length - 1;
            if(_loc2_[_loc3_] == "com" && _loc2_[_loc3_ - 1] == "sulake")
            {
               return true;
            }
            if(_loc2_[_loc3_] == "net" && _loc2_[_loc3_ - 1] == "varoke")
            {
               return true;
            }
            if(_loc2_[_loc3_ - 1] == "habbo")
            {
               return true;
            }
         }
         return false;
      }
      
      public function keyExists(param1:String) : Boolean
      {
         var _loc2_:String = this.var_849[param1] as String;
         return _loc2_ != null;
      }
      
      public function getKey(param1:String, param2:String = "", param3:Dictionary = null) : String
      {
         var _loc4_:String = this.var_849[param1] as String;
         if(_loc4_ == null)
         {
            _loc4_ = param2;
         }
         if(_loc4_ != null)
         {
            if(_loc4_.indexOf("%predefined%") > -1)
            {
               _loc4_ = _loc4_.replace("%predefined%",this.var_686);
               _loc4_ = _loc4_.replace("http://http://","http://");
            }
         }
         if(param3 != null)
         {
            _loc4_ = this.fillParams(_loc4_,param3);
         }
         return _loc4_;
      }
      
      public function setKey(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false) : void
      {
         if(param4)
         {
            if(this.var_849[param1] == null)
            {
               Logger.log(param1 + "=" + param2);
            }
         }
         if(this.var_2031.indexOf(param1) < 0 || param3)
         {
            this.var_849[param1] = param2;
         }
         if(param3)
         {
            this.var_2031.push(param1);
         }
      }
      
      private function fillParams(param1:String, param2:Dictionary) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < 10)
         {
            _loc4_ = param1.indexOf(var_1489);
            if(_loc4_ < 0)
            {
               break;
            }
            _loc5_ = param1.indexOf(var_1489,_loc4_ + 1);
            if(_loc5_ < 0)
            {
               break;
            }
            _loc6_ = param1.substring(_loc4_ + 1,_loc5_);
            _loc7_ = param2[_loc6_];
            param1 = param1.replace("%" + _loc6_ + "%",_loc7_);
            _loc3_++;
         }
         return param1;
      }
      
      public function getBoolean(param1:String, param2:Boolean) : Boolean
      {
         var _loc3_:String = this.var_849[param1] as String;
         if(_loc3_ == null)
         {
            return param2;
         }
         return _loc3_ == "1" || _loc3_.toLowerCase() == "true";
      }
   }
}
