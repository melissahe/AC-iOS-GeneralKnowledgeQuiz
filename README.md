# AC-iOS-GeneralKnowledgeQuiz

#### Lets make a General Knowlege Quiz app

### Step 1

Fork and clone this repo.

In the Question Class you will find an array of Question.

Create a tableView and populate it with the Questions.

<img width="312" alt="screen shot 2017-11-08 at 12 50 00 pm" src="https://user-images.githubusercontent.com/20875592/32564882-840a9744-c483-11e7-9a64-a0296710f34e.png">


### Step 2

Create a DetailViewController with a label and a pickerView. The label for the question and the picker view for the possible answers.

Checkout this little tutorial on UIPickerView

http://sourcefreeze.com/ios-uipickerview-example-using-swift/

Code it so that the user is nofified if they get the answer right or wrong.

![](https://media.giphy.com/media/d30oJYveOWlWXzAk/giphy.gif)


### Step 3

Create a SettingsViewController with 2 segmentedControlls and another pickerView to allow the user to filter the results by difficulty, type and category.

![](https://stackoverflow.com/questions/31278365/missing-navigation-bar-after-navigating-from-search-controller)

Create Settings Class with static variables that will save your currentSettings.

Have your Settings update when the user selects 


### Step 4

Add a Statistics class with static variables that keep track of right and wrong answers. 

Create a custom TableViewCell so that all of the question is displayed and not cut off.


