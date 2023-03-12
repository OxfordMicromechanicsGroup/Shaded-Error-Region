function Uncertainty2Fill(x, y,Uncertainty,options)
%Uncertainty2Fill written by R J Scales 2023 as part of Shaded-Error-Region 
%GitHub repository for the OxfordMicromechanicsGroup.
%This function converts the uncertainty values for each x value into
% a shaded region instead to plot for ease of reading the data.
% 
% Inputs:
%       x (:, 1) double
%           This is the x-values for the plot
%       y (:, 1) double
%           This is the y-values for the plot
%       Uncertainty (:, :) double
%           This is the uncertainty for the corresponding x values, if it
%           is 1 column it will treat the +- uncertainty the same, but if
%           two columns then the first will be + uncertainty and the second
%           will be - uncertainty.
%       Name-Value Pairs:
%           Color (1,:) char = 'blue'
%               Enter in a valid character colour definition for the colour
%               of the region
%           Alpha (1,1) double = 0.1
%               This is the alpha of the filled in region, 0 being
%               completely transparent and 1 being opaque.
%           DisplayName (1,:) char
%               This is the DisplayName for the legend of this filled in
%               region in the plot. If left blank then it will not show any
%               entry.

arguments
    x (:, 1) double
    y (:, 1) double
    Uncertainty (:, :) double
    options.Color (1,:) char = 'blue'
    options.Alpha (1,1) double = 0.1
    options.DisplayName (1,:) char
end

if size(Uncertainty, 2) == 1
    PlusError = Uncertainty(:,1);
    MinusError = Uncertainty(:,1);
else
    PlusError = Uncertainty(:,2);
    MinusError = Uncertainty(:,1);
end

UpperBound = y+PlusError;
LowerBound = y-MinusError;

xPath = vertcat(x, flipud(x));
yPath = vertcat(UpperBound, flipud(LowerBound));

% https://uk.mathworks.com/help/matlab/creating_plots/line-plot-with-confidence-bounds.html
p = fill(xPath,yPath,options.Color);
p.FaceAlpha = options.Alpha;      
p.EdgeColor = 'none';  
if isfield(options, 'DisplayName') == 0
    set(get(get(p,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
else
    p.DisplayName = options.DisplayName;
end

end