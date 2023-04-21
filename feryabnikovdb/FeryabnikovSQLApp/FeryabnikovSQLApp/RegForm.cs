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

namespace FeryabnikovSQLApp
{
    public partial class RegForm : Form
    {
        public RegForm()
        {
            InitializeComponent();
            textBox1.Text = "Введите логин";
            textBox1.ForeColor = Color.Gray;
            textBox2.Text = "Введите пароль";
            textBox2.ForeColor = Color.Gray;
            textBox3.Text = "Введите имя";
            textBox3.ForeColor = Color.Gray;
            textBox4.Text = "Введите почту";
            textBox4.ForeColor = Color.Gray;
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

        private void RegButton_Click(object sender, EventArgs e)
        {
            if (textBox1.ForeColor == Color.Gray || textBox2.ForeColor == Color.Gray || textBox3.ForeColor == Color.Gray || textBox4.ForeColor == Color.Gray)
            {
                MessageBox.Show("Заполните все поля!");
            }
            else
            {
                if (isUserExists())
                    return;
                DB DB = new DB();
                MySqlCommand command = new MySqlCommand("INSERT INTO `users` (`login`, `password`, `name`, `mail`) VALUES (@login, @password, @name, @mail)", DB.getConnection());

                command.Parameters.Add("@login", MySqlDbType.VarChar).Value = textBox1.Text;
                command.Parameters.Add("@password", MySqlDbType.VarChar).Value = textBox2.Text;
                command.Parameters.Add("@name", MySqlDbType.VarChar).Value = textBox3.Text;
                command.Parameters.Add("@mail", MySqlDbType.VarChar).Value = textBox4.Text;

                DB.openConnection();

                if (command.ExecuteNonQuery() == 1)
                    MessageBox.Show("Вы успешно зарегистрировались!");
                else
                    MessageBox.Show("Ошибка! Аккаунт не создан.");
                DB.closeConnection();
            }
        }
        public Boolean isUserExists()
        {
            DB DB = new DB();
            DataTable table = new DataTable();

            MySqlDataAdapter adapter = new MySqlDataAdapter();
            MySqlCommand command = new MySqlCommand("SELECT * FROM `users` WHERE `login` = @uL", DB.getConnection());
            command.Parameters.Add("@uL", MySqlDbType.VarChar).Value = textBox1.Text;


            adapter.SelectCommand = command;
            adapter.Fill(table);

            if (table.Rows.Count > 0)
            {
                MessageBox.Show("Логин занят!");
                return true;
            }
            else
            {
                return false;
            }
        }
            private void textBox1_Enter(object sender, EventArgs e)
        {
            textBox1.Text = "";
            textBox1.ForeColor = Color.Black;
        }

        private void textBox2_Enter(object sender, EventArgs e)
        {
            textBox2.Text = "";
            textBox2.ForeColor = Color.Black;
            textBox2.UseSystemPasswordChar = true;
        }

        private void textBox3_Enter(object sender, EventArgs e)
        {
            textBox3.Text = "";
            textBox3.ForeColor = Color.Black;
        }

        private void textBox4_Enter(object sender, EventArgs e)
        {
            textBox4.Text = "";
            textBox4.ForeColor = Color.Black;
        }

        private void textBox1_Leave(object sender, EventArgs e)
        {
            if (textBox1.Text == "")
            {
                textBox1.Text = "Введите логин";
                textBox1.ForeColor = Color.Gray;
            }
        }

        private void textBox2_Leave(object sender, EventArgs e)
        {
            if (textBox2.Text == "")
            {
                textBox2.Text = "Введите пароль";
                textBox2.ForeColor = Color.Gray;
                textBox2.UseSystemPasswordChar = false;
            }
        }

        private void textBox3_Leave(object sender, EventArgs e)
        {
            if (textBox3.Text == "")
            {
                textBox3.Text = "Введите имя";
                textBox3.ForeColor = Color.Gray;
            }
        }

        private void textBox4_Leave(object sender, EventArgs e)
        {
            if (textBox4.Text == "")
            {
                textBox4.Text = "Введите почту";
                textBox4.ForeColor = Color.Gray;
            }
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void pictureBox4_Click(object sender, EventArgs e)
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

        private void pictureBox4_MouseEnter(object sender, EventArgs e)
        {
            pictureBox4.BackColor = Color.Gray;
        }

        private void pictureBox4_MouseLeave(object sender, EventArgs e)
        {
            pictureBox4.BackColor = Color.Transparent;
        }

        private void pictureBox3_MouseEnter(object sender, EventArgs e)
        {
            pictureBox3.BackColor = Color.Gray;
        }

        private void pictureBox3_MouseLeave(object sender, EventArgs e)
        {
            pictureBox3.BackColor = Color.Transparent;
        }

        private void label1_Click(object sender, EventArgs e)
        {
            AutoriForm Aut = new AutoriForm();
            Aut.Show();
            this.Close();
        }
    }
}
