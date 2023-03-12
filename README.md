# Shaded-Error-Region
The purpose of these set of codes is to make it quick and easy for one to shade in uncertainty (aka error) regions in MATLAB, which is a nicer way to show uncertainty than error bars. Prediction intervals are a great way to show the confidence of the fit to the data, and so this variant of shaded region has been utilised as a function.

## Uncertainty2Fill Function
The *Uncertainty2Fill* takes in x and y data, along with the uncertainty in y (current version) which can be single valued or double valued for different upper and lower uncertainties. It then uses this data to produce a shaded in region, similar to the examples that *predInt2Fill* produces below. The main difference between this and *predInt2Fill* is that *Uncertainty2Fill* takes in x and y with uncertainty values whereas *predInt2Fill* takes in x and predInt output.


## predInt2Fill Function
The predInt2Fill stands for *prediction inteval to fill* as it takes in the x data and preciction interval output from said data, and then uses the *fill* function to add in a shaded region that relates to the prediction bounds.

Below shows two examples, one of the typical errorbar plot that could be obtained by usinf predInt and the below one which uses predInt2Fill instead.

**Simple errorbar plot**

![Example plot using errorbar](https://github.com/OxfordMicromechanicsGroup/Shaded-Error-Region/blob/main/Example_Errorbar.png?raw=true)


**predInt2Fill**

![Example plot using predInt2Fill](https://github.com/OxfordMicromechanicsGroup/Shaded-Error-Region/blob/main/Example_Shaded.png?raw=true)

The benefit of using predInt2Fill is that in the above image the shaded region consists of 1000 x values from 0 to 900. It is a lot clearer to see these boundaries than if done with a 20 or 1000 valued errorbar plot as shown underneath this plot.

**Example of errorbar with 20 points**

![Example plot using errorbar with 20 points](https://github.com/OxfordMicromechanicsGroup/Shaded-Error-Region/blob/main/Example_Errorbar_20_points.png?raw=true)

**Example of errorbar with 1000 points**

![Example plot using errorbar with 1000 points](https://github.com/OxfordMicromechanicsGroup/Shaded-Error-Region/blob/main/Example_Errorbar_1000_points.png?raw=true)
