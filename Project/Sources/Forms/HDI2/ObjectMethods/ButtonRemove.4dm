
var $current : Object
Use (Storage:C1525)
	$current:=Storage:C1525.tracking
End use 

ds:C1482.product.removeRandomProduct()

$updateStamp:=ds:C1482.getGlobalStamp()
$deletedProdInfo:=ds:C1482.__DeletedRecords.all()
$modifyedProd:=ds:C1482.product.query("__GlobalStamp >= :1"; $current.referenceStamp)

Form:C1466.updateRecords:=String:C10($modifyedProd.length)
Form:C1466.deletedRecords:=String:C10($deletedProdInfo.length)
Form:C1466.globalStamp:=String:C10($updateStamp)
Form:C1466.currentSelection:=ds:C1482.product.all()

