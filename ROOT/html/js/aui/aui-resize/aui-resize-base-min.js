AUI.add("aui-resize-base",function(ar){var ac=ar.Lang,d=ac.isArray,aH=ac.isBoolean,aM=ac.isString,aE=ac.trim,o=ar.Array.indexOf,aj=".",w=",",u=" ",t="active",Q="activeHandle",W="activeHandleEl",C="all",av="autoHide",aB="bottom",aw="className",az="cursor",n="diagonal",aA="dotted",al="dragCursor",b="grip",ad="gripsmall",E="handle",P="handles",ai="hidden",a="horizontal",ag="icon",z="inner",c="left",O="margin",s="node",H="nodeName",aa="none",K="offsetHeight",aL="offsetWidth",f="parentNode",p="position",aD="proxy",D="proxyEl",l="relative",at="resize",r="resizing",i="right",aQ="static",k="top",ap="vertical",ax="wrap",aN="wrapper",ao="wrapTypes",M="resize:mouseUp",x="resize:resize",F="resize:align",N="resize:end",X="resize:start",ae="t",aP="tr",af="r",aG="br",aq="b",aJ="bl",ak="l",aR="tl",U=function(A){return(A instanceof ar.Node);},aS=function(A){return E+A.toUpperCase();},aO=function(){return Array.prototype.slice.call(arguments).join(u);},V=ar.cached(function(A){return A.substring(0,1).toUpperCase()+A.substring(1);}),G=ar.getClassName,m=G(ag),aI=G(ag,ad,n,aG),an=G(ag,b,aA,a),Z=G(ag,b,aA,ap),aF=G(at),ay=G(at,E),ah=G(at,E,t),g=G(at,E,z),I=G(at,E,z,"{handle}"),aT=G(at,E,"{handle}"),e=G(at,ai,P),y=G(at,aD),aK=G(at,aN),am=aO(m,aI),aC=aO(m,an),q=aO(m,Z),h=/^(t|tr|b|bl|br|tl)$/i,Y=/^(tl|l|bl)$/i,S=/^(tl|t|tr)$/i,J=/^(bl|br|l|r|tl|tr)$/i,au='<div class="'+aO(ay,aT)+'">'+'<div class="'+aO(g,I)+'"></div>'+"</div>",ab='<div class="'+y+'"></div>',aU='<div class="'+aK+'"></div>',v=[ae,aP,af,aG,aq,aJ,ak,aR];var j=ar.Component.create({NAME:at,ATTRS:{activeHandle:{value:null,validator:aM},activeHandleEl:{value:null,validator:U},autoHide:{value:false,validator:aH},handles:{setter:function(L){var A=this;var B=[];if(d(L)){B=L;}else{if(aM(L)){if(L.toLowerCase()==C){B=v;}else{ar.each(L.split(w),function(T,R){var aV=aE(T);if(o(v,aV)>-1){B.push(aV);}});}}}return B;},value:C},node:{setter:ar.one},proxy:{value:false,validator:aH},proxyEl:{setter:ar.one,valueFn:function(){return ar.Node.create(ab);}},resizing:{value:false,validator:aH},wrap:{setter:function(R){var A=this;var L=A.get(s);var T=L.get(H);var B=A.get(ao);if(B.test(T)){R=true;}return R;},value:false,validator:aH},wrapTypes:{readOnly:true,value:/canvas|textarea|input|select|button|img/i},wrapper:{setter:function(){var A=this;var B=A.get(s);var L=B;if(A.get(ax)){L=ar.Node.create(aU);B.placeBefore(L);L.append(B);A._copyStyles(B,L);B.setStyles({position:aQ,left:0,top:0});}return L;},value:null,writeOnce:true}},EXTENDS:ar.Base,prototype:{CSS_INNER_HANDLE_MAP:{r:q,l:q,t:aC,b:aC,br:am},changeHeightHandles:false,changeLeftHandles:false,changeTopHandles:false,changeWidthHandles:false,delegate:null,info:null,lastInfo:null,originalInfo:null,initializer:function(){var A=this;A.info={};A.originalInfo={};A.get(s).addClass(aF);A.renderer();},renderUI:function(){var A=this;A._renderHandles();A._renderProxy();},bindUI:function(){var A=this;A._createEvents();A._bindDD();A._bindHandle();},syncUI:function(){var A=this;A._setHideHandlesUI(A.get(av));},destructor:function(){var A=this;var B=A.get(s);var L=A.get(aN);ar.Event.purgeElement(L,true);A.eachHandle(function(R){A.delegate.dd.destroy();R.remove(true);});if(A.get(ax)){B.setStyles({margin:L.getStyle(O),position:L.getStyle(p)});L.placeBefore(B);L.remove(true);}B.removeClass(aF);B.removeClass(e);},renderer:function(){this.renderUI();this.bindUI();this.syncUI();},eachHandle:function(B){var A=this;ar.each(A.get(P),function(T,L){var R=A.get(aS(T));B.apply(A,[R,T,L]);});},_bindDD:function(){var A=this;A.delegate=new ar.DD.Delegate({bubbleTargets:A,container:A.get(aN),dragConfig:{clickPixelThresh:0,clickTimeThresh:0,useShim:true,move:false},nodes:aj+ay,target:false});A.on("drag:drag",A._handleResizeEvent);A.on("drag:dropmiss",A._handleMouseUpEvent);A.on("drag:end",A._handleResizeEndEvent);A.on("drag:start",A._handleResizeStartEvent);},_bindHandle:function(){var A=this;var B=A.get(aN);B.on("mouseenter",ar.bind(A._onWrapperMouseEnter,A));B.on("mouseleave",ar.bind(A._onWrapperMouseLeave,A));B.delegate("mouseenter",ar.bind(A._onHandleMouseEnter,A),aj+ay);B.delegate("mouseleave",ar.bind(A._onHandleMouseLeave,A),aj+ay);},_createEvents:function(){var A=this;var B=function(L,R){A.publish(L,{defaultFn:R,queuable:false,emitFacade:true,bubbles:true,prefix:at});};B(X,this._defResizeStartFn);B(x,this._defResizeFn);B(F,this._defResizeAlignFn);B(N,this._defResizeEndFn);B(M,this._defMouseUpFn);},_renderHandles:function(){var A=this;var B=A.get(aN);A.eachHandle(function(L){B.append(L);});},_renderProxy:function(){var B=this;var A=B.get(D);B.get(aN).get(f).append(A.hide());},_buildHandle:function(L){var A=this;var B=ar.Node.create(ac.sub(au,{handle:L}));B.one(aj+g).addClass(A.CSS_INNER_HANDLE_MAP[L]);return B;},_checkSize:function(aV,B){var A=this;var T=A.info;var R=A.originalInfo;var L=(aV==K)?k:c;T[aV]=B;if(((L==c)&&A.changeLeftHandles)||((L==k)&&A.changeTopHandles)){T[L]=R[L]+R[aV]-B;}},_copyStyles:function(T,aV){var B=this;var A=T.getStyle(p).toLowerCase();if(A==aQ){A=l;}var R={position:A};var L={};ar.each([k,i,aB,c],function(aX){var aW=O+V(aX);L[aW]=aV.getStyle(aW);R[aW]=T.getStyle(aW);});aV.setStyles(R);T.setStyles(L);T.setStyles({margin:0});aV.set(K,T.get(K));aV.set(aL,T.get(aL));},_extractHandleName:ar.cached(function(L){var B=L.get(aw);var A=B.match(new RegExp(G(at,E,"(\\w{1,2})\\b")));return A?A[1]:null;}),_getInfo:function(T,A){var aZ=this,aV;var aX=A.dragEvent.target;if(A){aV=(aX.actXY.length?aX.actXY:aX.lastXY);}var aW=T.getXY();var R=aW[0];var L=aW[1];var B=T.get(K);var aY=T.get(aL);return{actXY:aV,bottom:(L+B),left:R,offsetHeight:B,offsetWidth:aY,right:(R+aY),top:L};},_resize:function(){var A=this;var R=A.get(Q);var aV=A.info;var T=A.originalInfo;var L=aV.actXY[0]-T.actXY[0];var B=aV.actXY[1]-T.actXY[1];var aW={t:function(){aV.top=T.top+B;aV.offsetHeight=T.offsetHeight-B;},r:function(){aV.offsetWidth=T.offsetWidth+L;},l:function(){aV.left=T.left+L;aV.offsetWidth=T.offsetWidth-L;},b:function(){aV.offsetHeight=T.offsetHeight+B;},tr:function(){this.t();
this.r();},br:function(){this.b();this.r();},tl:function(){this.t();this.l();},bl:function(){this.b();this.l();}};aW[R](L,B);},_setOffset:function(L,B,A){L.set(aL,B);L.set(K,A);},_syncUI:function(){var A=this;var L=A.info;var R=A.get(aN);var B=A.get(s);A._setOffset(R,L.offsetWidth,L.offsetHeight);if(A.changeLeftHandles||A.changeTopHandles){R.setXY([L.left,L.top]);}if(!R.compareTo(B)){A._setOffset(B,L.offsetWidth,L.offsetHeight);}if(ar.UA.webkit){B.setStyle(at,aa);}},_syncProxyUI:function(){var B=this;var R=B.info;var L=B.get(W);var A=B.get(D);var T=L.getStyle(az);A.show().setStyle(az,T);B.delegate.dd.set(al,T);B._setOffset(A,R.offsetWidth,R.offsetHeight);A.setXY([R.left,R.top]);},_updateChangeHandleInfo:function(B){var A=this;A.changeHeightHandles=h.test(B);A.changeLeftHandles=Y.test(B);A.changeTopHandles=S.test(B);A.changeWidthHandles=J.test(B);},_updateInfo:function(B){var A=this;A.info=A._getInfo(A.get(aN),B);},_setActiveHandlesUI:function(L){var A=this;var B=A.get(W);if(B){if(L){A.eachHandle(function(R){R.removeClass(ah);});B.addClass(ah);}else{B.removeClass(ah);}}},_setHideHandlesUI:function(B){var A=this;var L=A.get(aN);if(!A.get(r)){if(B){L.addClass(e);}else{L.removeClass(e);}}},_defMouseUpFn:function(B){var A=this;A.set(r,false);},_defResizeFn:function(B){var A=this;A._handleResizeAlignEvent(B.dragEvent);if(A.get(aD)){A._syncProxyUI();}else{A._syncUI();}},_defResizeAlignFn:function(B){var A=this;var R=A.originalInfo;A.lastInfo=A.info;A._updateInfo(B);var L=A.info;A._resize();if(!A.con){if(L.offsetHeight<=15){A._checkSize(K,15);}if(L.offsetWidth<=15){A._checkSize(aL,15);}}},_defResizeEndFn:function(L){var A=this;var B=L.dragEvent.target;B.actXY=[];if(A.get(aD)){A._syncProxyUI();A.get(D).hide();}A._syncUI();A.set(Q,null);A.set(W,null);A._setActiveHandlesUI(false);},_defResizeStartFn:function(B){var A=this;A.set(r,true);A.originalInfo=A._getInfo(A.get(aN),B);A._updateInfo(B);},_handleMouseUpEvent:function(A){this.fire(M,{dragEvent:A,info:this.info});},_handleResizeEvent:function(A){this.fire(x,{dragEvent:A,info:this.info});},_handleResizeAlignEvent:function(A){this.fire(F,{dragEvent:A,info:this.info});},_handleResizeEndEvent:function(A){this.fire(N,{dragEvent:A,info:this.info});},_handleResizeStartEvent:function(A){this.fire(X,{dragEvent:A,info:this.info});},_onWrapperMouseEnter:function(B){var A=this;if(A.get(av)){A._setHideHandlesUI(false);}},_onWrapperMouseLeave:function(B){var A=this;if(A.get(av)){A._setHideHandlesUI(true);}},_onHandleMouseEnter:function(L){var A=this;var B=L.currentTarget;var R=A._extractHandleName(B);if(!A.get(r)){A.set(Q,R);A.set(W,B);A._setActiveHandlesUI(true);A._updateChangeHandleInfo(R);}},_onHandleMouseLeave:function(B){var A=this;if(!A.get(r)){A._setActiveHandlesUI(false);}}}});ar.each(v,function(B,A){j.ATTRS[aS(B)]={setter:function(){return this._buildHandle(B);},value:null,writeOnce:true};});ar.Resize=j;},"1.5.2",{skinnable:true,requires:["aui-base","dd-drag","dd-delegate","dd-drop"]});