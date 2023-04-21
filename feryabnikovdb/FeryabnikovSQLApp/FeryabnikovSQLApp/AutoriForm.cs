using MySqlConnector;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace FeryabnikovSQLApp
{
    public partial class AutoriForm : Form
    {
        public AutoriForm()
        {
            InitializeComponent();
            LoginText.Text = "Введите логин";
            LoginText.ForeColor = Color.Gray;
            PasswordText.Text = "Введите пароль";
            PasswordText.ForeColor = Color.Gray;
            this.MouseDown += new MouseEventHandler(Form_MouseDown);
            this.MouseMove += new MouseEventHandler(Form_MouseMove);
            this.MouseUp += new MouseEventHandler(Form_MouseUp);
        }

        private bool isDragging = false;
        private Point lastCursor;
        private Point lastForm;

        
        private void Form_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                isDragging = true;
                lastCursor = Cursor.Position;
                lastForm = this.Location;
            }
        }

        
        private void Form_MouseMove(object sender, MouseEventArgs e)
        {
            if (isDragging)
            {
                int xDiff = Cursor.Position.X - lastCursor.X;
                int yDiff = Cursor.Position.Y - lastCursor.Y;
                this.Location = new Point(lastForm.X + xDiff, lastForm.Y + yDiff);
            }
        }

        
        private void Form_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                isDragging = false;
            }
        }
        private void LoginText_Enter(object sender, EventArgs e)
        {
            LoginText.Text = "";
            LoginText.ForeColor = Color.Black;
        }

        private void LoginText_Leave(object sender, EventArgs e)
        {
            if (LoginText.Text == "")
            {
                LoginText.Text = "Введите логин";
                LoginText.ForeColor = Color.Gray;
            }
            
        }

        private void PasswordText_Enter(object sender, EventArgs e)
        {
            PasswordText.Text = "";
            PasswordText.ForeColor = Color.Black;
            PasswordText.UseSystemPasswordChar = true;
            pictureBox6.Image = FeryabnikovSQLApp.Properties.Resources.hidden;
        }

        private void PasswordText_Leave(object sender, EventArgs e)
        {
            if (PasswordText.Text == "")
            {
                PasswordText.Text = "Введите пароль";
                PasswordText.ForeColor = Color.Gray;
                PasswordText.UseSystemPasswordChar = false;
                pictureBox6.Image = FeryabnikovSQLApp.Properties.Resources.eye;
            }
        }

        private void label2_Click(object sender, EventArgs e) // переходик на форму регистрации
        {
            RegForm Registration = new RegForm();
            Registration.Show();
            this.Hide();
        }

        private void pictureBox6_Click(object sender, EventArgs e) // скрыть или показать пароль
        {
            if (PasswordText.UseSystemPasswordChar == true)
            {
                PasswordText.UseSystemPasswordChar = false;
                pictureBox6.Image = FeryabnikovSQLApp.Properties.Resources.eye;
            }
            else
            {
                PasswordText.UseSystemPasswordChar = true;
                pictureBox6.Image = FeryabnikovSQLApp.Properties.Resources.hidden;
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Вы уверены, что хотите выйти из приложения?", "Выход", MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation))
            {
                Application.Exit();
            }
            else
            {
                return;
            }
        }

        private void pictureBox1_MouseEnter(object sender, EventArgs e)
        {
            pictureBox1.BackColor = Color.Gray;
        }

        private void pictureBox1_MouseLeave(object sender, EventArgs e)
        {
            pictureBox1.BackColor = Color.Transparent;
        }

        private void pictureBox2_MouseEnter(object sender, EventArgs e)
        {
            pictureBox2.BackColor = Color.Gray;
        }

        private void pictureBox2_MouseLeave(object sender, EventArgs e)
        {
            pictureBox2.BackColor = Color.Transparent;
        }

        private void LoginButton_Click(object sender, EventArgs e)
        {
            String loginUser = LoginText.Text;
            String passUser = PasswordText.Text;

            DataBaseForm CheckBase = new DataBaseForm();

            DB DB = new DB();
            DataTable table = new DataTable();

            MySqlDataAdapter adapter = new MySqlDataAdapter();

            if (LoginText.ForeColor == Color.Gray || PasswordText.ForeColor == Color.Gray)
            {
                MessageBox.Show("Заполните все поля!");

            }
            else
            {
                MySqlCommand command = new MySqlCommand("SELECT * FROM `users` WHERE `login` = @uL AND `password` = @uP", DB.getConnection());
                command.Parameters.Add("@uL", MySqlDbType.VarChar).Value = loginUser;
                command.Parameters.Add("@uP", MySqlDbType.VarChar).Value = passUser;

                adapter.SelectCommand = command;
                adapter.Fill(table);

                if (table.Rows.Count > 0)
                {
                    MessageBox.Show("Авторизация прошла успешно!");
                    CheckBase.Show();
                    this.Hide();
                }
                else
                {
                    MessageBox.Show("Аккаунта не существует, либо же данные не верны!");
                }

            }
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }
    }
}
