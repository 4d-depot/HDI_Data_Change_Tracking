
var $current : Object
Use (Storage:C1525)
	$current:=Storage:C1525.tracking
End use 

ds:C1482.product.editRandomProduct()

$updateStamp:=ds:C1482.getGlobalStamp()

//$deletedProdInfo:=ds.__DeletedRecords.query("__Stamp >= :1 and __TableName = :2"; $current; "product")
$deletedProdInfo:=ds:C1482.__DeletedRecords.all()

$modifyedProd:=ds:C1482.product.query("__GlobalStamp >= :1"; $current.referenceStamp)

If (ds:C1482.product.all().length>0)
	$val:=ds:C1482.product.get($modifyedProd.first().ID)
End if 

Form:C1466.updateRecords:=$modifyedProd.length
Form:C1466.deletedRecords:=$deletedProdInfo.length
Form:C1466.globalStamp:=String:C10($updateStamp)
Form:C1466.currentSelection:=ds:C1482.product.all()
