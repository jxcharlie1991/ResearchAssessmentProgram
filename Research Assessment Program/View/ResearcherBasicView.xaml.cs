using Research_Assessment_Program.Controller;
using Research_Assessment_Program.Database;
using Research_Assessment_Program.Model;
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

namespace Research_Assessment_Program.View
{
    /// <summary>
    /// Interaction logic for ResearcherBasicView.xaml
    /// </summary>
    public partial class ResearcherBasicView : UserControl
    {



        List<Researcher> frs = new List<Researcher>();

        public static event EventHandler bAC;



        public ResearcherBasicView()
        {
            InitializeComponent();


            ResearcherController.viewableresearcher = ResearcherAdapter.LoadBasicResearcher();
            ResearcherList.ItemsSource = ResearcherController.viewableresearcher;

            LevelFilter.Items.Add("All researchers");
            foreach (string s in Enum.GetNames(typeof(EmploymentLevel)))
                LevelFilter.Items.Add(s);
            LevelFilter.SelectedIndex = 0;


        }

        private void LevelComobo_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            frs = ResearcherController.LevelFilter(ResearcherController.viewableresearcher, (string)LevelFilter.SelectedValue);
            ResearcherList.ItemsSource = frs;
        }



        private void FilterTxt_TextChanged(object sender, TextChangedEventArgs e)
        {
            frs = ResearcherController.NameFilter(ResearcherController.viewableresearcher, FilterTxt.Text);
            ResearcherList.ItemsSource = frs;
        }

        private void ResearcherList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Researcher selected = new Researcher();
            if (ResearcherList.SelectedItem != null)
            {
                selected = (Researcher)ResearcherList.SelectedItem;
            }

            ResearcherController.completeR = ResearcherAdapter.LoadFullResearcher(selected);
            ResearcherController.completeR.Publications = PublicationAdapter.LoadBasicPublication(ResearcherController.completeR);
            if (ResearcherController.completeR.Level != EmploymentLevel.Student)
                ((Staff)ResearcherController.completeR).Supervises = ResearcherAdapter.LoadSupervises(ResearcherController.completeR);
            ResearcherController.completeR.position = PositionAdapter.LoadPosition(ResearcherController.completeR);
         

            bAC(sender, e);//Let the CompleteView refresh.
        }

    }
}
 