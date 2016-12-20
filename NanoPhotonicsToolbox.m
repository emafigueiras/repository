function NanoPhotonicsToolbox
    
    clear all
    close all force
    
    
    % f is the main window of the program 
    f = figure('Visible','off',...
            'Position',[0,0,1370,610],...
            'CloseRequestFcn',@f_closereq);
    
    uipanel('Parent',f,...
            'Units','Pixels',...
            'Position',[0 0 1370 610]);
    set(f,'toolbar','none');
    set(f,'menubar','none');
    
    % Create the structure of global variables and save it in the
    % workspace. Every global variable and every object will be saved in
    % this structure, so that it can be accessed by every function
    vars.objects.figures.f = f;
    flim = [];
    assignin('base','flim',flim);
    assignin('base','vars',vars);
    
    
    % Building the software and all its components.
    
    % Tabs
    [tgroup,tab_data,tab_LifetimeAnalysis] = gui_tabs(f);
    assignin_Tabs(tgroup,tab_data,tab_LifetimeAnalysis);
    
    % Figures
    % magic figure and pushbutton are auxilliary developer only. These must
    % be deleted
    [f_histGaussFit,f_magic,pb_magic] = gui_figures;
    assignin_Figures(f_histGaussFit,f_magic,pb_magic);
    
    %File menu
    [menuFile,menuFile_Load,menuFile_Load_hdf5_bin,menuFile_Load_hdf5,menuFile_Load_bin] = gui_menuFile;
    
    %Navigation panel
    [panel_navigation,pb_navigateSelectFolder,tb_navigateSelectFolder,table_fileList] = gui_panel_navigation;
    
    
    %Intensity Panel
    panel_Intensity = gui_panel_Intensity;
    
        %subpanel Select curve
    gui_subpanel_selectCurve(panel_Intensity);
    
    %Decay Curve Panel
    panel_Curve = gui_panel_decayCurve;
        %subpanel loadBin
    gui_subpanel_loadBin(panel_Curve);
    

    %Lifetime Analysis tab
    panel_lifetimeAnalysis = gui_panel_lifetimeAnalysis;
        %Subpanel lifetimeAnalysis
    gui_subpanel_flimModelTest(panel_lifetimeAnalysis);
    gui_subpanel_calculateFlimImage(panel_lifetimeAnalysis);
    gui_subpanel_histGaussFitWindow(panel_lifetimeAnalysis);
    
    % lifetime Interface
    gui_panel_lifetimeFittingInterface(tab_LifetimeAnalysis);
    
    %Panel Multiple Files analysis*****************************************
    gui_panel_multipleFilesAnalysis([]);
    
    %figure f_histGaussFit
    gui_f_histGaussFit(f_histGaussFit);
    
    flim = [];
    
    %initialization of variables and components
    
    initializeVariables;
    initializeComponents;
    sortFields;
end
