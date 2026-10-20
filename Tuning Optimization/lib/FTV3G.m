% Configure aircraft model for FTV3F
% FTV 3G model Parameters 
if WithTail==1   %UTAIL
    disp("* 3G UTail *");
        
    if strcmp(CGConfig,'TBF')
        % TO BE FLOWN, from BBD FTC16 Vehicle Configuration Release
        % (0073-FTV3G) 2026-10-09, updated with
        % From TMI release October 9 2026, ESTIMATED FTV3G UTAIL TMI CALCULATOR_REV0.xlsx
        xCgLocMacBWB      = 59.94;% PERCENT MAC BWB

    elseif strcmp(CGConfig,'FWD')|| strcmp(CGConfig,'BASE')|| strcmp(CGConfig,'AFT')
        %FWD, BASE, AFT, TBF
        switch CGConfig
            case "FWD"
                xCgLocMacBWB = 58.28;% PERCENT MAC BWB
            case "BASE"
                xCgLocMacBWB = 59.94;% PERCENT MAC BWB
            case "AFT"
                xCgLocMacBWB = 61.60;% PERCENT MAC BWB
            otherwise
                error("something wrong with xCgLocMac parameter selection");
        end
               
    elseif isnumeric(CGConfig)
        xCgLocMacBWB = CGConfig;% PERCENT MAC BWB
        
    % Numeric CG already allows for custom CG
    % elseif strcmp(CGConfig,'CUSTOM') % 
    %     warning("Selected AC config will overwrite CG posn without inertia adjustment!")
    %     warning("CGConfig using xCgLocMacBWB_custom parameter");
    %     xCgLocMacBWB = xCgLocMacBWB_custom;% PERCENT MAC BWB
    %     % Use expirmental inertia
    %     % TO BE FLOWN, from BFP data obtained 2023-11-23
    %     Weight            = 14.8892 * 2.2;% Lbs 
    %     ZCG               = 0.0096 / 0.02540 * (ZCGScale+1);% In inches
    %     IXX               = 1.3750 * 3417.17 * (1+InertiaScale);% In-lbs
    %     IYY               = ((-0.055*xCgLocMacBWB) + 4.7342) * 3417.17 * (1+InertiaScale);% In-lbs
    %     IZZ               = ((-0.055*xCgLocMacBWB) + 5.9754) * 3417.17 * (1+InertiaScale);% In-lbs
    %     IXZ               = 0.0680 * 3417.17 * (1+InertiaScale);% In-lbs
    else
        error("something wrong with CGConfig parameter selection");
    end

    if Flap == 0
        Weight            = 15.1667 * 2.2;% Lbs
        ZCG               = 0.0091 / 0.02540 * (ZCGScale+1);% In inches
        IXX               = 1.3781 * 3417.17 * (1+InertiaScale);% In-lbs
        IYY               = ((-0.0591*xCgLocMacBWB) + 4.9876) * 3417.17 * (1+InertiaScale);% In-lbs
        IZZ               = ((-0.0591*xCgLocMacBWB) + 6.2312) * 3417.17 * (1+InertiaScale);% In-lbs
        IXZ               = 0.0680 * 3417.17 * (1+InertiaScale);% In-lbs

    elseif Flap == 2
        Weight            = 15.2769 * 2.2;% Lbs
        ZCG               = 0.0090 / 0.02540 * (ZCGScale+1);% In inches
        IXX               = 1.4229 * 3417.17 * (1+InertiaScale);% In-lbs
        IYY               = ((-0.0601*xCgLocMacBWB) + 5.0499) * 3417.17 * (1+InertiaScale);% In-lbs
        IZZ               = ((-0.0601*xCgLocMacBWB) + 6.3400) * 3417.17 * (1+InertiaScale);% In-lbs
        IXZ               = 0.0680 * 3417.17 * (1+InertiaScale);% In-lbs
    end

elseif WithTail==0 %TAILLESS
    disp("* 3G Tailless *");
    error("No 3G Tailless config available!");
      
end

if(exist('Aircraft_Mass_Config', 'var'))
    if strcmp(Aircraft_Mass_Config,'CUSTOM')
        warning("Aircraft Mass Config set to CUSTOM and overriden. Inertia assumed to be that of base TBF configuration")
        Weight = MassBWB_custom * 2.2;% Lbs 
    end
end
    
