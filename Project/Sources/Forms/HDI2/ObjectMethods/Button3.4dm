If (Form:C1466.trace)
	TRACE:C157
End if 

var $current : Object
var $modifiedProd : cs:C1710.productSelection
var $deletedProdInfo : cs:C1710.__DeletedRecordsSelection

// Retrieve the $current object from Storage.tracking
$current:=Storage:C1525.tracking

// Call the ds.product.editRandomProduct() function to edit a random product
ds:C1482.product.editRandomProduct()

// Query to obtain information about deleted products since the reference timestamp of $current
$deletedProdInfo:=ds:C1482.__DeletedRecords.query("__Stamp >= :1"; $current.referenceStamp)

// Assign the information about deleted products to Form.__DeletedRecordsSelection
Form:C1466.__DeletedRecordsSelection:=$deletedProdInfo

If (ds:C1482.product.all().length>0)
	// Query to obtain modified products since the reference timestamp of $current
	$modifiedProd:=ds:C1482.product.query("__GlobalStamp >= :1"; $current.referenceStamp)
	
	// Assign the number of modified products to Form.updateRecords
	Form:C1466.updateRecords:=$modifiedProd.length
Else 
	Form:C1466.updateRecords:=0
End if 

// Assign values to Form
Form:C1466.refStamp:=$current.referenceStamp
Form:C1466.deletedRecords:=$deletedProdInfo.length
Form:C1466.globalStamp:=ds:C1482.getGlobalStamp()
Form:C1466.productSelection:=ds:C1482.product.all()

// Initialize the Meta value
InitMetaValue