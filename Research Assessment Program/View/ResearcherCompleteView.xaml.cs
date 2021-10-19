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
    /// Interaction logic for ResearcherCompleteView.xaml
    /// </summary>
    public partial class ResearcherCompleteView : UserControl
    {

        public static event EventHandler rAP;
       private  Publication selected = new Publication();
        private int formerint = 0;
        private int laterint = 9999;
        public ResearcherCompleteView()
        {
            InitializeComponent();
            // MessageBox.Show(ResearcherController.completeR.position);
           // MessageBox.Show(Researcher.position.); 

        }




        private void SupervisionButton_Click(object sender, RoutedEventArgs e)
        {
            ShowNameWindow shownamewin = new ShowNameWindow();


            if (ResearcherController.completeR.Level != EmploymentLevel.Student)
            {
                shownamewin.SupervisesList.Items.Clear();
                shownamewin.SupervisesList.ItemsSource = ((Staff)ResearcherController.completeR).Supervises;
            }
            shownamewin.ShowDialog();
            // foreach (Researcher r in ((Staff)ResearcherController.completeR).Supervises)
            //   MessageBox.Show(r.GivenName);


        }

        private void PublicationButton_Click(object sender, RoutedEventArgs e)
        {
            ResearcherController.completeR.Cumulative = ResearcherController.LoadCumulative(ResearcherController.completeR);
            CumulativeWindow count = new CumulativeWindow();

            count.CumulativeGrid.Items.Clear();
            count.CumulativeGrid.ItemsSource = ResearcherController.completeR.Cumulative;

            count.ShowDialog();


        }

   

        

        private void PublicationList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (PublicationList.SelectedItem != null)
                selected = (Publication)PublicationList.SelectedItem;
            ResearcherController.completeR.specifiedPublication = PublicationAdapter.LoadCompletePublication(selected);
            rAP(sender, e);
        }

     

        private void Go_Click(object sender, RoutedEventArgs e)
        {
            if (FormerTxt.Text == "")
                FormerTxt.Text = "0";
            if (LaterTxt.Text == "")
                LaterTxt.Text = DateTime.Now.Year.ToString();
            try
            {
                formerint = Convert.ToInt32(FormerTxt.Text);
                laterint = Convert.ToInt32(LaterTxt.Text);
            }
            catch (Exception)
            {
                MessageBox.Show("Please check whether you input a right number");
            }
            
            PublicationList.ItemsSource = ResearcherController.YearFilter(formerint, laterint, ResearcherController.completeR.Publications);
        }
    }
}
