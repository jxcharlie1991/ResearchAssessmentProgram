﻿#pragma checksum "..\..\..\View\ResearcherBasicView.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "C14514AC3380700DBAA154A7CC3BF636ACF574B66E3746E5D0BD36B940F548FE"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using Research_Assessment_Program.Controller;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace Research_Assessment_Program.View {
    
    
    /// <summary>
    /// ResearcherBasicView
    /// </summary>
    public partial class ResearcherBasicView : System.Windows.Controls.UserControl, System.Windows.Markup.IComponentConnector {
        
        
        #line 10 "..\..\..\View\ResearcherBasicView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid ResearcherGrid;
        
        #line default
        #line hidden
        
        
        #line 22 "..\..\..\View\ResearcherBasicView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox FilterTxt;
        
        #line default
        #line hidden
        
        
        #line 30 "..\..\..\View\ResearcherBasicView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox LevelFilter;
        
        #line default
        #line hidden
        
        
        #line 32 "..\..\..\View\ResearcherBasicView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListBox ResearcherList;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Research Assessment Program;component/view/researcherbasicview.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\View\ResearcherBasicView.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.ResearcherGrid = ((System.Windows.Controls.Grid)(target));
            return;
            case 2:
            this.FilterTxt = ((System.Windows.Controls.TextBox)(target));
            
            #line 22 "..\..\..\View\ResearcherBasicView.xaml"
            this.FilterTxt.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.FilterTxt_TextChanged);
            
            #line default
            #line hidden
            return;
            case 3:
            this.LevelFilter = ((System.Windows.Controls.ComboBox)(target));
            
            #line 30 "..\..\..\View\ResearcherBasicView.xaml"
            this.LevelFilter.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.LevelComobo_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.ResearcherList = ((System.Windows.Controls.ListBox)(target));
            
            #line 33 "..\..\..\View\ResearcherBasicView.xaml"
            this.ResearcherList.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.ResearcherList_SelectionChanged);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}
