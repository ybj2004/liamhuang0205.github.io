using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Guanli : System.Web.UI.Page
{
    public static DataTable classData = new DataTable();
    /*private string TodayDate ;*/
    protected void Page_Load(object sender, EventArgs e)
    {
        KebiaoSQL kebiaoSql = new KebiaoSQL();
        DataSet kechengData = kebiaoSql.getKechen(0);
        // =========== 以上数据 从数据库读出 =============

        txtid.Text = kebiaoSql.getNextPK().ToString();
        DataTable KechenName = kebiaoSql.getKechenName(0, "课程名");
        foreach (DataRow row in KechenName.Rows)
        {
            this.KechengName.Items.Add(row[0].ToString());
        }
        DateTime TodayDate = DateTime.Today.Date;
        KechenDate.Value = TodayDate.Date.ToString("yyyy-MM-dd");
        this.ClassesGrid.DataSource = kechengData;
        this.ClassesGrid.DataBind();
        /*============ 初始化参数 ============*/
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        KebiaoSQL kebiaoSql = new KebiaoSQL();
        int remaining = Convert.ToInt32(this.txtRemaining.Text);
        int number = Convert.ToInt32(this.txtNumber.Text);
        int jiage = Convert.ToInt32(this.txtJiage.Text);
        /*string KechenDate = Convert.ToString(this.KechenDate.Value);*/
        kebiaoSql.createKechen(this.KechengName.Text, this.KechenDate.Value, this.TimeStart.Value, this.TimeEnd.Value, remaining, number, this.txtPlace.Text, this.txtTeacher.Text, jiage);
        Response.Redirect("Guanli.aspx");
    }

    protected void btnDel_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(this.txtid.Text);
        KebiaoSQL kebiaoSql = new KebiaoSQL();
        kebiaoSql.deleteKechen(id);
        Response.Redirect("Guanli.aspx");
    }


    protected void btnChg_Click(object sender, EventArgs e)
    {
        KebiaoSQL kebiaoSql = new KebiaoSQL(); 
        int id = Convert.ToInt32(this.txtid.Text);
        int remaining = Convert.ToInt32(this.txtRemaining.Text);
        int number = Convert.ToInt32(this.txtNumber.Text);
        int jiage = Convert.ToInt32(this.txtJiage.Text);
        kebiaoSql.changeKechen(id, this.KechengName.Text, this.KechenDate.Value, this.TimeStart.Value, this.TimeEnd.Value, remaining, number, this.txtPlace.Text, this.txtTeacher.Text, jiage);
        Response.Redirect("Guanli.aspx");
    }
}