enum CampaignStatusEnum {
  draft('DRAFT'),
  published('PUBLISHED'),
  awaitingDraw('AWAITING_DRAW'),
  finished('FINISHED');

  final String value;
  const CampaignStatusEnum(this.value);
}
