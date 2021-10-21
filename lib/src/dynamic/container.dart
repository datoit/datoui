import 'dart:convert';

import 'package:datoit/src/dynamic/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:datoit/src/dynamic/render_parser.dart';
import 'package:datoit/src/dynamic/units/unit_model.dart';
import 'package:dio/dio.dart';

/// The container interface of dynamic widget
class FLDyContainer extends StatefulWidget {
  FLDyContainer({
    Key key,
    this.placeholder,
    this.jsonObject,
    this.jsonUrl,
  })  : assert(placeholder != null || (jsonObject != null || jsonUrl != null) ),
        super(key: key) {
    FLDyLogger.log('initial dynamic container');
    FLDyLogger.logStartTime();
  }

  final Widget placeholder;
  final dynamic jsonObject;
  final dynamic jsonUrl;

  @override
  State<FLDyContainer> createState() => FLDyContainerState();
}

class FLDyContainerState extends State<FLDyContainer> {
  Widget _renderContent;

  @override
  void initState() {
    super.initState();

    if (widget.jsonUrl != null) {
      getUrlData(widget.jsonUrl);
    }else{
      if (widget.jsonObject != null) {
        FLDyLogger.logStartTime();
        FLDyUnitModel unitModel = processJsonObject(widget.jsonObject);
        FLDyLogger.logEndTime('serialization');
        FLDyLogger.logStartTime();
        _renderContent = FLDyRenderParser.markupContent(unitModel);
        FLDyLogger.logEndTime('markup content');
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FLDyLogger.logEndTime('total');
    });
  }

  void getUrlData(dynamic jsonUrl) async {
    FLDyLogger.logStartTime();
    Response response = await Dio().get(jsonUrl);
    FLDyLogger.logEndTime('query interface');
    loadJson(response.data.toString());
  }

  FLDyUnitModel processJsonObject(dynamic jsonObj) {
    assert(debugJsonAndType(jsonObj));
    // convert json string to unit model
    if (jsonObj is String) {
      jsonObj = json.decode(jsonObj);
    } else if (jsonObj is FLDyUnitModel) {
      return jsonObj;
    }
    return FLDyUnitModel.fromJson(jsonObj);
  }

  void loadJson(dynamic jsonObj) {
    assert(debugJsonAndType(jsonObj));
    _loadJsonAndRender(jsonObj);
  }

  void _loadJsonAndRender(dynamic jsonObj) {
    FLDyUnitModel unitModel = processJsonObject(jsonObj);
    // mark up content
    setState(() {
      _renderContent = FLDyRenderParser.markupContent(unitModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _renderContent ?? widget.placeholder;
  }
}

bool debugJsonAndType(dynamic jsonObj) {
  if (jsonObj == null) return false;
  if (jsonObj.runtimeType != Map &&
      jsonObj.runtimeType != String &&
      jsonObj.runtimeType != FLDyUnitModel) {
    throw FlutterError(
        '[FLUI Dyanmic]: need a valid parameter object (json / json string / FLDyUnitModel)');
  }
  return true;
}
