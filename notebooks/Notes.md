Suggestions on the U-Nets from David:
- You might also consider adding BatchNorm2d  before each ReLU in the double_conv to speed up convergence?
- Also you can make the # channels a variable. Right now you have 64,128,256,512. It can be C, 2*C, 4*C, 8*C. Then you can adjust the size of the model just by adjusting C. Unet is the model I’ve used most often, so its good to become very familiar with it.
