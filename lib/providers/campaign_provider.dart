import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_mg_app/models/campaign_model.dart';

final selectedCampaignProvider = StateProvider<CampaignModel?>((ref) => null);