Class extends DataClass

exposed Function getProductData()
	var $productsFile : 4D:C1709.File
	var $productsCol : Collection
	
	$productsFile:=File:C1566("/PACKAGE/Project/Sources/products.json")
	$productsCol:=JSON Parse:C1218($productsFile.getText())
	This:C1470.all().drop()
	This:C1470.fromCollection($productsCol)
	
exposed Function removeRandomProduct()
	var $prod : cs:C1710.productEntity
	var $randomProdNumber : Integer
	var $deletedStamp : Integer
	
	If (This:C1470.all().length>0)
		$randomProdNumber:=This:C1470.getRandomNumber()
		$prod:=This:C1470.all()[$randomProdNumber]
		
		$deletedStamp:=ds:C1482.getGlobalStamp()
		Form:C1466.lastUpdate:=$prod.name
		Form:C1466.editionType:=String:C10("have been deleted")
		Form:C1466.stamp:=$deletedStamp
		
		This:C1470.all()[$randomProdNumber].drop()
	End if 
	
exposed Function editRandomProduct()
	var $prod : cs:C1710.productEntity
	var $randomProdNumber : Integer
	var $updatedStamp : Integer
	
	If (This:C1470.all().length>0)
		$randomProdNumber:=This:C1470.getRandomNumber()
		$updatedStamp:=ds:C1482.getGlobalStamp()
		Form:C1466.randomVal:=$randomProdNumber
		
		$prod:=This:C1470.all()[$randomProdNumber]
		$prod.price+=1
		$prod.save()
		
		Form:C1466.lastUpdate:=$prod.name
		Form:C1466.editionType:=String:C10("have been updated")
		
		Form:C1466.stamp:=$updatedStamp
	End if 
	
Function getRandomNumber() : Integer
	
	var $randomProdNumber : Integer
	$randomProdNumber:=(Random:C100%(This:C1470.all().length))
	return $randomProdNumber