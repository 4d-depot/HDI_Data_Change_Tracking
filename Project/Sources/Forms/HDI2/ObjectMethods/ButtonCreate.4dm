
var $track : Object

ds:C1482.product.getProductData()

Use (Storage:C1525)
	Storage:C1525.tracking:=New shared object:C1526("referenceStamp"; ds:C1482.getGlobalStamp())
	$track:=Storage:C1525.tracking
End use 

Form:C1466.dataGenerated:="Data created successfully! The new reference stamp is "+String:C10($track.referenceStamp)+"."

Form:C1466.productSelection:=ds:C1482.product.all()
Form:C1466.refStamp:=$track.referenceStamp
Form:C1466.globalStamp:=$track.referenceStamp
Form:C1466.updateRecords:=0
Form:C1466.deletedRecords:=0
