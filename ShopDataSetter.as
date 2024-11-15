class ShopDataSetter extends InventoryDataSetter
{
  /* PRIVATE VARIABLES */
	
	private var _barterBuyMult: Number;
	private var _coinRatio: Number;
	
	
  /* INITIALIZATION */
	
	public function ShopDataSetter(a_barterBuyMult: Number, a_coinratio: Number)
	{
		super();

		_barterBuyMult = (a_barterBuyMult == undefined) ? 1.0 : a_barterBuyMult;
		_coinRatio = (a_coinratio == undefined) ? 50.0 : a_coinratio;
	}


  /* PUBLIC FUNCTIONS */
	
  // @override InventoryDataSetter
	public function processEntry(a_entryObject: Object, a_itemInfo: Object): Void
	{
		if (a_itemInfo == undefined)
			a_itemInfo = new Object();

    var extra = a_entryObject.extra;
    a_entryObject.infoRank = extra.rank;
		a_entryObject.infoStock = extra.count == undefined ? "-" : extra.count;

		var value = Math.max((extra.value * _barterBuyMult * _coinRatio), 1);
		a_entryObject.value = Math.floor(value + 0.5);
		a_itemInfo.value = a_entryObject.value

		super.processEntry(a_entryObject, a_itemInfo);
	}

}