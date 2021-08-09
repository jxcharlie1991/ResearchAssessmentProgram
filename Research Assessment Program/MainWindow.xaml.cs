using Research_Assessment_Program.Controller;
using Research_Assessment_Program.Database;
using Research_Assessment_Program.Model;
using Research_Assessment_Program.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Research_Assessment_Program
{
    /// <summary>
    /// MainWindow.xaml 的交互逻辑
    /// </summary>
    public partial class MainWindow : Window
    {


        public MainWindow()
        {
            InitializeComponent();
            //CompleteResearcher.PreviousData.Items.Clear();

            //ResearcherBasicView.bAC +=/*new EventHandler (*/ ResearcherBasicView_bAC;
            //ResearcherCompleteView.rAP += ResearcherCompleteView_rAP;

        }

        //private void ResearcherCompleteView_rAP(object sender, EventArgs e)
        //{
        //    if (CompleteResearcher.PublicationList.SelectedItem != null)
        //        CompletePublication.CompletePublicationList.DataContext = ResearcherController.completeR.specifiedPublication;

        //}

        //private void ResearcherBasicView_bAC(object sender, EventArgs e)
        //{
        //    if (BasicResearcher.ResearcherList.SelectedItem != null)
        //        CompleteResearcher.DataContext = ResearcherController.completeR;
        //    //CompleteResearcher.PreviousData.Items.Clear();
        //    CompleteResearcher.PreviousData.ItemsSource = ResearcherController.completeR.position;
        //    CompleteResearcher.PublicationList.ItemsSource = ResearcherController.completeR.Publications;
        //}
    }
}
