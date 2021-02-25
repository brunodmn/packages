# jet_form_builder

A simple way to autogenerate form like content to show information and allow user interaction.

## Display
![alt text](https://github.com/brunodmn/packages/blob/master/jet_form_builder/example/sample_ss.png?raw=true)

## Usage
 You just need to add the items you want to display in a nested list, and call `JetDisplay` passing this list as parameter;

```dart
 List<List<JetDisplayItem>> listParent = [];

    //Row 1
    listParent.add([
      // Column 1
      new JetDisplayItem(
          type: JetFormTypes.text, label: 'Due date', text: '25/02'),
      // Column 2
      new JetDisplayItem(
          type: JetFormTypes.text, label: 'Amount', text: '35,00')
    ]);
    
    //Row 2
    listParent.add([
      // Column 1
      new JetDisplayItem(
          type: JetFormTypes.text, label: 'Obs', text: 'Already paid, this will show all over the available space')
    ]);
    
    //Row 3
    listParent.add([
      // Column 1
      new JetDisplayItem(
          type: JetFormTypes.button,
          label: 'Print invoice',
          onPressed: () => print('321')),
      // Column 2
      new JetDisplayItem(
          type: JetFormTypes.button,
          label: 'Copy code',
          onPressed: () => print('123')),
    ]); 
    
    @override
  Widget build(BuildContext context) {
    return JetDisplay(listParent);   
  }   
    
    
```
