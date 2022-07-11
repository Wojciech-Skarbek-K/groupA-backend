Use KainosJob_PatrykK;

create table User(
    user_id smallint primary key auto_increment,
    email varchar(50) not null unique,
    `password` varchar(20) not null,
    `role` enum('Employee', 'Admin') not null,
    token varchar(200) UNIQUE not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    phone_number varchar(15) not null,
    `location` enum('Belfast', 'Gdansk', 'Birmingham', 'London')
);

create table Capability(
    cap_id smallint primary key auto_increment,
    cap_name varchar(50) not null
);

create table Job_Roles(
    role_id smallint primary key auto_increment,
    role_name varchar(50) not null,
    role_description varchar(1500) not null,
    sharepoint_url varchar(1000) not null,
    cap_id smallint,
    foreign key (cap_id) references Capability(cap_id) 
);

CREATE TABLE competency( 
   comp_id varchar(50) PRIMARY KEY, 
   apprentice VARCHAR(2000)  not null, 
   trainee VARCHAR(2000)  not null, 
   associate VARCHAR(2000)  not null, 
   senior_associate VARCHAR(2000)  not null, 
   consultant VARCHAR(2000)  not null, 
   manager VARCHAR(2000) not null, 
   principal VARCHAR(2000) not null
);

CREATE TABLE band( 
   band_id INT PRIMARY KEY, 
   band_name VARCHAR(50) not null
);

CREATE TABLE training( 
   training_id INT PRIMARY KEY, 
   training VARCHAR(50) not null,
   sharepoint_url VARCHAR(1000) not null
);

 CREATE TABLE training_bands( 
   training_id INT, 
   band_id INT,
   FOREIGN KEY (training_id) REFERENCES training(training_id),
   FOREIGN KEY (band_id) REFERENCES band(band_id)
);

insert into 
Capability (cap_name) 
values 
('Engineering'),
('Platforms'),
('Data'),
('Artificial Intelligence'),
('Cyber Security'), 
('Workday'),
('Experience Design'),
('Product'),
('Delivery'),
('Operations'),
('Business Development and Marketing'),
('Organisational Strategy and Planning'),
('People'),
('Commercial and Financial Management'),
('Business Services Support');

# insert job roles


insert into 
Job_Roles (role_name, role_description, sharepoint_url, cap_id)
values
('Innovation Lead',
 'As an Innovation Lead (Consultant) in Kainos, youll be responsible will lead the team, working with the Innovation Lead in a dynamic and hands-on role which will involve managing and developing the team, implementing and shaping Kainos innovation strategy and effectively communicating the exciting work we undertake both internally and within the wider technology community.',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Innovation%20Lead%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1',
  1),
('Lead Software Engineer',
 'As a Lead Software Engineer (Consultant) in Kainos, you’ll be responsible for leading teams and developing high quality solutions which delight our customers and impact the lives of users worldwide. It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow.',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Lead%20Software%20Engineer%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1',
  1),
('Lead NFTEngineer',
 'As a Lead NFTEngineer(Consultant)in Kainos, youll be a technical leader and innovator in Non-Functional Testing, providing strong test leadership and direction within a multi-skilled agile team. Taking responsibility for the strategy, design and development of non-functional requirements & tests, youll help the team to deliver working application software that is scalable and performant for theusers. Its a fast-paced environment so it is important for you to make sound, reasoned decisions.',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Lead%20NFT%20Engineer%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1',
  1),
('Technical Architect',
 'As a Technical Architect (Consultant) in Kainos, you’ll be responsible for leading teams and developing high quality solutions which delight our customers and impact the lives of users worldwide. As a technical leader on a project, you’ll work with customer architects to agree technical designs, advising on estimated effort and technical implications of user stories and user journeys.',
  'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspid=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Technical%20Architect%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1',
   1),
('Senior People Support Associate',
 'As a Senior People Support Associate at Kainos, you will provide an excellent service across all Business Units in Kainos globally. You will be responsible for offering advice and guidance to employees on all People related matters, ensuring legislative guidance is adhered to and high standards are met and maintained in all people related processes. You will also be a key player in supporting the delivery of the People Strategy.',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FPeople%2FPeople%20Support%2FJob%20profile%20%2D%20Senior%20People%20Support%20Associate%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FPeople%2FPeople%20Support&p=true&ga=1',
 13),
('Talent Acquisition Specialist',
 'The Talent Acquisition team at Kainos are responsible for end to end delivery aligned to BU hiring demands. Based in locations across UK &I, Europe and North America, the team focus on direct sourcing channels to create a best in class candidate experience, in the most cost-effective way',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FPeople%2FTalent%20Acquisition%2FJob%20profile%20%2D%20Talent%20Acquisition%20Specialist%20%28As%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FPeople%2FTalent%20Acquisition&p=true&ga=1',
  13),
('Service Delivery Manager',
 'As a Service Delivery Manager in Kainos, you will assist in the direction and management of Support. Manages and champions assigned areas of ownership across assigned clients and within Kainos as a whole. Responsible for managing the delivery of a support service, and managing the client-relationship, across projects. Works with Clients and the Sales team to drive out new opportunities and expand Kainos footprint within our account.',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FDelivery%2FJob%20profile%20%2D%20Service%20Delivery%20Management%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FDelivery&p=true&ga=1',
  9),

('Workday Integrations Consultant',
 'As a Workday Integrations Consultant (Trainee) in Kainos, you will be responsible for supporting the successful specification, design and configuration of enterprise-scale Workday product solutions. This will be done by working with internal delivery teams to provide solutions that are fit for purpose and commercially viable. Understanding and translating customer requirements, as well as hands-on product configuration is essential for this role.',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FWorkday%2FIntegrations%2FJob%20Profile%20%2D%20Integrations%20Consultant%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FWorkday%2FIntegrations&p=true&ga=1',
 6);

INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id)
   VALUES ('Data Engineer', 
   'As a Data Engineer (Associate) in Kainos you will work within a multi-skilled agile team to design and develop large-scale data processing software to meet user needs in demanding production environments.  ', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Data%20Engineer%20%28As%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3),
   ('Trainee Data Engineer', 
   'As a Trainee Data Engineer (Trainee) in Kainos you will enter the Kainos Big Data Academy. Successful graduates of the Big Data Academy will become Associate Data Engineers, following a period of extended project-based training.  ', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Trainee%20Data%20Engineer%20%28T%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3),
   ('Data Analyst', 
   'As a Data Analyst (Associate) in Kainos, you’ll be responsible for matching the needs of data insight with understanding of the available data. Data analysts work closely with customers to produce insight products including reports, dashboards and visualisations but also contribute to project understanding of existing data structures so that inputs and outputs are fully understood.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Data%20Analyst%20%28As%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3),
   ('Senior Data Engineer', 
   'As a Senior Data Engineer (Senior Associate) at Kainos, you will be responsible or designing and developing data processing and data persistence software components for solutions which handle data at scale. Working in agile teams, Senior Data Engineers provide strong development leadership and take responsibility for significant technical components of data systems . You will work within a multi-skilled agile team to design and develop large-scale data processing software to meet user needs in demanding production environments.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Senior%20Data%20Engineer%20%28SA%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3),
   ('Senior Data Analyst', 
   'As a Senior Data Analyst (Senior Associate) at Kainos, you’ll be responsible for matching the needs of data insight with understanding of the available data. Data analysts work closely with customers to produce insight products including reports, dashboards and visualisations but also contribute to project understanding of existing data structures so that inputs and outputs are fully understood. It therefore has a strong consulting element.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Senior%20Data%20Analyst%20%28SA%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3),
   ('Principal Data Solution Architect', 
   'As a Principal Data Solution Architect in Kainos, you’ll be accountable for successful delivery of contemporary data solutions across multiple customers.  You’ll have gravitas within the data community and strong thought leadership, working with senior stakeholders to agree principles, strategic direction and functional and non-functional designs. You will manage other architects and engineers in the capability to help them navigate their careers.  ', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Principal%20Data%20Solution%20Architect%20%28P%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3),
   ('Principal Data Architect', 
   'As a Principal Data Architect in Kainos, you’ll be accountable for successful delivery of data solutions across multiple customers; taking responsibility across traditional data architecture disciplines around data structures, data flows, data sourcing and data governance.  This will mean working at a solution and enterprise level.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Principal%20Data%20Architect%20%28P%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3),
   ('Data Solution Architect', 
   'As a Data Solution Architect (Manager) in Kainos, you’ll be responsible for a multi- skilled agile teams to design and deliver contemporary data solutions. You will be a quality orientated pragmatist, where you balance trade-offs to successfully deliver complex solutions. You will be viewed as an authority figure for data technology solutions, providing strong technical and thought leadership.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Data%20Solution%20Architect%20%28M%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3),
   ('Data Architect', 
   'As a Data Architect (Manager) in Kainos, you’ll be responsible for providing SME guidance in traditional data architecture disciplines around data structures, data flows, data sourcing and data governance. Data Architects work closely with clients to understand their data requirements and take responsibility for ensuring solutions are fit for purpose. They also provide technical leadership for the rest of the team in the area of data.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Data%20Architect%20%28M%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3),
   ('Data Consultant', 
   'As a Data Consultant(Manager) in Kainos, you will combinethought leadership, delivery and commercial experience to identify, securenew business aswe help customers on their digital transformation journeys which have vital data considerationswhere value can be unlocked.', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20Profile%20%2D%20Data%20Consultant%20%28M%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3),
   ('Lead Data Analyst', 
   'As a Lead Data Analyst(Consultant)in Kainos, you’ll workwithin a multi-skilled agile team to collect and analyse data and enable insight tosenior customers that drives business improvement.', 
   'https://kainossoftwareltd.sharepoint.com/sites/PeopleTeam-SharedDrive/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FData%2FJob%20profile%20%2D%20Lead%20Data%20Analyst%20%28C%29%2Epdf&parent=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FData&p=true&ga=1', 
   3),
   ('Data Technical Architect', 
   'As a Data Technical Architect (Consultant) in Kainos, you will be responsible for designing and delivering technical components as part of a larger data solution. You will work closely with Solution Architects and Customer Architects to integrate these components into quality data solutions', 
   'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%2FJob%20profile%20%2D%20Data%20Technical%20Architect%20%28C%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData&p=true&ga=1', 
   3);

   #AI capability - 4
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Trainee AI Engineer', 'As a Trainee Artificial Intelligence (AI) Engineer in Kainos, you’ll be responsible for contributing to the development of high-quality solutions which integrate AI and ML technologies that delight our customers and impact the lives of users worldwide. You’ll do this whilst gaining awareness and learning about new AI technologies, frameworks and approaches, with talented colleagues that will help you to learn, develop and grow.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence%2FJob%20Profile%20%2D%20Trainee%20AI%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence&p=true&ga=1', 4);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Associate Data Scientist', 'As  an  Associate  Data  Scientist  in  Kainos,  you’ll  be  responsible  for  developing  high  quality  solutions that use AI and ML technologies to delight our customers and impact the lives of users  worldwide.  It’s  a  fast-paced  environment  so  it  is  important  for  you  to  make  sound,  reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence%2FJob%20Profile%20%2D%20Associate%20Data%20Scientist%20%28Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence&p=true&ga=1', 4);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Senior AI Engineer', 'As a   Senior Artificial Intelligence (AI) Engineer in Kainos, you’ll be responsible for developing high  quality  solutions  that  use  AI  and  ML  technologies  which  delight  our  customers  and  impact the lives of users worldwide. It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow as you, in turn, mentor those around you.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence%2FJob%20Profile%20%2D%20Senior%20AI%20Engineer%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence&p=true&ga=1', 4);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Consultant Data Scientist', 'As a Consultant Data Scientist in Kainos, you’ll be responsible for leading teams and developing high quality solutions that use AI and ML technologies to delight our customers and impact the lives of users worldwide. It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow. As the technical leader in the team, you will also interact with customers, share knowledge and mentor those around you.You will manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence%2FJob%20Profile%20%2D%20Consultant%20Data%20Scientist%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence&p=true&ga=1', 4);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('AI Engineering Manager', 'As an Artificial Intelligence (AI) Engineer Manager in Kainos, you’ll be responsible for successful delivery of large-scale high-quality solutions that use AI and ML technologiesthat delight our customers and impact the lives of users worldwide.  You will provide leadership and support to AI engineering teams by understanding the outcomes the solution is trying to achieve, the engineering implications and complexity surrounding you and your teams designs and helping teams make the right decisions.  You’ll work with senior stakeholders to agree architectural principles, strategic direction and functional and non-functional designs.  As a technical leader, you will work with your colleagues to inform development of policy and standards, develop customer relationships, account management and share knowledge and mentor those around you. You’ll do this whilst advising about new technologies and approaches to AI/ML, with room to learn, develop and grow.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence%2FJob%20Profile%20%2D%20AI%20Engineering%20Manager%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence&p=true&ga=1', 4);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Principal Data Scientist', 'As a Principal Data Scientist in Kainos, you’ll be accountable for successful delivery of large-scale high-quality solutions that use AI and ML technologies that delight our customers and impact the lives of users worldwide.  You  will  provide  assurance  and  support  to  multi-skilled  agile  teams  by  understanding  the  outcomes   the   solution   is   trying   to   achieve,   the   data   implications   and   complexity   surrounding you and your teams designs and helping teams make the right decisions.  You’ll work with senior stakeholders to agree architectural principles, strategic direction and functional and non-functional designs. You will proactively develop new alliances with other vendors that will provide Kainos with new capability.  As  a  technical  leader,  you  will  work  with  your  colleagues  to  lead  development  of  policy  and  standards,  develop  customer  relationships,  develop  account  strategies  and  share  knowledge  and  mentor  those  around  you.  You’ll  do  this  whilst  advising  about  new  technologies and approaches to data, with room to learn, develop and grow.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence%2FJob%20Profile%20%2D%20Principal%20Data%20Scientist%20%28Principal%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FArtificial%20Intelligence&p=true&ga=1', 4);

#Operations capability - 10
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Programme Office Assistant', 'As a Programme Office Assistant(Trainee) at Kainos, you’ll be responsible for ensuring that a high-quality service is provided to the Project Management and Operations capabilities within the Digital Services/Workday/Central Servicesbusiness unit, demonstrating best practice throughout. You will provide administrative support for our engagements and will have a key role in the efficient management and delivery of these projects.You’ll work as part of the Digital Services/Workday/Central ServicesOperations PMO team and report into the Operations Manager. It’s a fast-paced environment so it is important for you to ensure that workload is prioritised, and tasks completed in a timely manner.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOperations%2FJob%20Profile%20%2D%20Programme%20Office%20Assistant%20%28T%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOperations&p=true&ga=1', 10);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Staffing Consultant', 'As a Staffing Consultant (Senior Associate) at Kainos, you will be responsible for the day-to-day  staffing  of  projects  within  a  Business  unit.  You will ensure the  talent  pool  has  the  appropriate skills for forecasted projects while maximising profitable utilisation. You will also be responsible for ensuring the accurate closure of month end accounts.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOperations%2FJob%20Profile%20%2D%20Staffing%20Consultant%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOperations&p=true&ga=1', 10);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Operations Manager', 'As an Operations Manager (Manager) at Kainos, you will be responsible managing and improving the day to day operational processes within the Business Unit (BU) which supports  the management team and wider BU including sales, revenue and staff forecasting, staff allocation and recruitment forecasting, month-end closure, profitabilityand working capital.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOperations%2FJob%20Profile%20%2D%20Operations%20Manager%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOperations&p=true&ga=1', 10);

#Business Development and Marketing - 11
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Marketing Assistant', 'Our vision is to create a world-class business development and marketing capability for Kainos, fuelled by a diverse range of highly talented and motivated professionals working collaboratively and innovatively to ensure we continue our growth trajectory.We do this via an open and supportive environment where colleagues can share information, learn from one another, and excel in their own career.  With consistent ways of working aligned to industry best practice, we buildsustainable and predictable sales pipelines for our market-leading offerings.As a Marketing AssistantatKainos,we will support you to build your career in marketing. You will gain a solid grounding in many aspects ofmarketing, branding and communications.You will work as part of a team creatingand delivering the marketing campaignsand activitiesthatare aligned to commercial needsand designed to drive brand awareness/support recruitment/generate leads to fuel the sales pipeline.This will include competitor research, supporting content creationand aspects of activation, digital and social media marketing, reporting and evaluation, and undertaking defined projects to support delivery against plan.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FMarketing%20%2D%20Business%2FJob%20profile%20%2D%20Marketing%20Assistant%20%28T%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FMarketing%20%2D%20Business&p=true&ga=1', 11);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Customer Success Manager', 'Our vision is to create a world-class Customer Success capability for Kainos, fuelled by a diverse range of highly talented and motivated professionals working collaboratively and innovatively to ensure we retain clients and expand our footprint within existing clients to continue our growth trajectory.We do this via an open and supportive environment where colleagues can share information, learn from one another and excel in their own career.  With consistent ways of working aligned to industry best practice, we retain and grow our footprint by delivering on the clients desired outcomes for our market-leading offerings.As a Customer Success Manager (Consultant) at Kainos, you will partner with our customers post-sale to drive adoption and ensure customer satisfaction, growth, and retention. You will be the bridge between our Professional Services, Operational Support and Business Development teams. You will work directly with customers to ensure that their overall user experience with Kainos Smart is a success.We are looking for an individual who strike the right mix of sales, account management, domain knowledge and customer management skills.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FClient%20Management%2FJob%20Profile%20%2D%20Customer%20Success%20Manger%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FClient%20Management&p=true&ga=1', 11);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Digital Strategy Director', 'Our vision is to create a world-class business development and marketing capability for Kainos, fuelled by a diverse range of highly talented and motivated professionals working collaboratively and innovatively to ensure we continue our growth trajectory.We do this via an open and supportive environment where colleagues can share information, learn from one another, and excel in their own career.  With consistent ways of working aligned to industry best practice, we build sustainable and predictable sales pipelines for our market-leading offerings.As the Digital Strategy Director(Principal) atKainos, you willbe responsible globally the company’sdigital strategyand the tech stack(including ownership of our website platform), Marketo marketing automation (injecting great practice into our team to drive lead generation) and marketing operationsacross the world (ensuring marketing is transparent, consistent in approachand accountable viaROI reporting).You will use your extensive digital experience and commercial knowledge to lead and mentor themartech & Ops team whoact as a Digital Centre of Excellence tomarketing colleagues oncampaigns togenerate leads. You will foster strong relationships with key internal stakeholders and external partners acting as a trusted advisor.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FMarketing%20%2D%20Martech%20and%20Ops%2FJob%20profile%20%2D%20Digital%20Strategy%20Director%20%28P%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FMarketing%20%2D%20Martech%20and%20Ops&p=true&ga=1', 11);

#Organisational Strategy and Planning - 12
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('BU Chief Operating Officer', 'The Business Unit COOplays a strategic role in supportingthe deliveryof the business goals andstrategic ambitions–to be a great employer, to delight our customers and to be a growing, profitable and responsible company.  As an Executive in Kainos you will have an established track record in business planning, creating and operationalizing commercial and operational strategiesfor the business unit.As a member of the ExecutiveTeam,you will supportallour sustainability programmes and take personal responsibilityforone programme.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning%2FJob%20profile%20%2D%20BU%20COO%20%28Executive%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning&p=true&ga=1', 12);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Region/Sector Lead', 'As aRegion/Sector Lead (Leader) at Kainos,you will be accountable for sales, proposition development, customer relationships, overseeing project delivery and the Customer/Partnershiprelationship within the region/sector.This role sits within the Digital Services/WorkdayBUleadership team with accountability for sales performance, customer relationships, overseeing project delivery and Workday / sectorrelationship within a defined region. The Region/Sector Leadwill be responsible for leading sales and customer engagement teams to deliver the Sales Order Value and Customer Initiatives set out in the business plan. The Region/Sector Leadand their team will work closely with the BU Chief Operating Officer to accurately forecast demand, increase margin, develop propositions, and manage customer escalations.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning%2FJob%20profile%20-%20Region_Sector%20Lead%20%28Leader%29.pdf&parent=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning&p=true&ga=1', 12);
INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Head of Practice', 'As a Head of Practice (Manger) at Kainos, you will define and lead the strategy for the Practice. You will define the go to market offerings and commercial proposition for the Practice. You will also evolve the Practice to take advantage of Partner advancements and market changes. You will educate and motivate the sales Business Development function to deliver the SOV targets for the Practice. You will champion the growth of people and their capabilities to support the Practice in line with Kainos culture and values.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning%2FJob%20profile%20%2D%20Head%20of%20Practice%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning&p=true&ga=1', 12);

INSERT INTO Job_Roles( role_name, role_description,sharepoint_url,cap_id)
VALUES('Software Engineer','As a Software Engineer (Associate) in Kainos, you will be responsible for developing high quality solutions which delight our customers and impact the lives of users worldwide. You will do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow.','https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1', 1);

INSERT INTO Job_Roles( role_name, role_description,sharepoint_url,cap_id)
VALUES('Front-End Engineer','As a Front-end Engineer in Kainos, you will have the opportunity to use your expertise in developing high quality user interface solutions which delight our customers and impact the lives of users worldwide.   The projects you will join are varied, and often highly visible. You will be working in fast-paced, agile environments, so it is important for you to make sound, reasoned decisions, and recommendations on front-end and user interfaces with your colleagues. You are determined, flexible and always constructive; proactive in improving things and are always inclusive and respectful in your interactions with your team. You will be working alongside talented, diverse, enthusiastic colleagues, who will help you learn and develop as you, in turn, mentor those around you.', 'https://kainossoftwareltd.sharepoint.com/sites/PeopleTeam-SharedDrive/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FEngineering%2FEngineering%2FJob%20Profile%20%2D%20Senior%20Front%2DEnd%20Engineer%20%28SA%29%2Epdf&parent=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FEngineering%2FEngineering&p=true&ga=1',1);

INSERT INTO Job_Roles( role_name, role_description,sharepoint_url,cap_id)
VALUES('Support Technician','As a Support Technician (Associate) in Kainos, you will be responsible for analysing and solving complicated technical issues.  You will adhere to ITIL standards and will participate fully in the Incident management lifecycle.   You will work closely with clients, internal teams and 3rd Party vendors to ensure that problems are resolved. You will do this whilst learning about new approaches, with talented colleagues that will help you to learn, develop and grow.','https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Support%20Technician%20%28As%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering',1);

INSERT INTO Job_Roles( role_name, role_description, sharepoint_url, cap_id)
VALUES('Test Engineer','As a Test Engineer (Associate) in Kainos, you will work within a multi-skilled agile team, developing and executing functional automated and manual tests to help the team deliver working application software that meets user needs. You will do this whilst learning about new technologies and approaches, with talented colleagues who will help you learn, develop and grow.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FTesting%2FJob%20profile%20%2D%20Test%20Engineer%20%28Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FTesting&p=true&ga=1', 1);

INSERT INTO Job_Roles( role_name, role_description, sharepoint_url, cap_id)
VALUES('Product Specialist','As a Product Specialist at Kainos you will be responsible for delivering high quality solutions which delight our customers and impact the lives of users worldwide. It is a fast paced environment so it is important for you to make sound, reasoned decisions. You will do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow.You will be responsible for capturing and mapping customer needs to product capabilities, supporting clients throughout their implementation lifecycle and business processes changes as well as providing information to relevant engineering teams on improvements or fixes required in the products.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Product%20Specialist%20%28Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1',1);

INSERT INTO Job_Roles( role_name, role_description, sharepoint_url, cap_id) 
VALUES('Trainee Software Engineer','As a Trainee Software Engineer with Kainos, you will work on projects where you can make a real difference to people’s lives – the lives of people you know. After taking part in our award-winning, seven-week Engineering Academy, you will then join one of our many project teams, to learn from our experienced developers, project managers and customer-facing staff. You’ll have great support and mentoring, balanced with the experience of being given real, meaningful work to do, to help you truly develop both technically and professionally.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1', 1);  

INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Trainee Test Engineer', 'As a Test Engineer (Trainee) in Kainos, you’ll work within a multi-skilled agile team, developing and executing functional automated and manual tests to help the team deliver working application software that meets user needs. You’ll do this whilst learning about new technologies and approaches, with talented colleagues who will help you learn, develop and grow.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FTesting%2FJob%20profile%20%2D%20Trainee%20Test%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FTesting&p=true&ga=1', 1);

INSERT INTO Job_Roles (role_name, role_description, sharepoint_url, cap_id) 
VALUES ('Apprentice Software Engineer', 'Our highly-regarded scheme gives the opportunity to work for us as an Apprentice Software Engineer four days per week, while studying for a part time degree in Computing Systems one day per week, with Ulster University, Jordanstown, completing your degree in just four and a half years.', 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Apprentice%20Software%20Engineer%20%28Apprentice%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1', 1);
   
# populate band table
   
INSERT INTO band (band_id, band_name)
   VALUES (1, 
   'Principal'),
   (2, 
   'Manager'),
   (3, 
   'Consultant'),
   (4, 
   'Senior Associate'),
   (5, 
   'Associate'),
   (6, 
   'Trainee'),
   (7, 
   'Apprentice');

# populate competency table

INSERT INTO competency (comp_id, apprentice, trainee, associate, senior_associate, consultant, manager, principal)
   VALUES ('Personal Performance', 
   # Apprentice
   'Understands own strengths and areas of development. Self-aware of own well being and seeks support where appropriate.

Works with People Manager to sets and achieve goals by monitoring progress regularly against performance.

Flexible and willingness to learn on the job while proactively keeping up to date with the knowledge and skills needed.

Understands the company values and applies this to own principles. Is open and honest and acts respectfully with others and customers.', 
# Trainee
   'Understands others strengths and areas for development. Recognising diversity and its value within self and team. Proactively uses wellbeing tools to support self-regulation.

Able to identify own goals and discusses these with People Manager. Understands the need to work conscientiously to achieve tasks on schedule.

Identifies learning gaps and seeks out opportunities to improve skills. Open to developmental feedback from others.

Demonstrates positive behaviours when dealing with others and ensures application of the values while working and representing Kainos to our customers.',
# Associate
   'Seeks out new challenges and opportunities that may stretch current abilities. Builds on own self-awareness of overall wellbeing.

Recognises the need for SMART goals, and demonstrates a “can do” attitude, through having own internal standards of performance.

Seeks out opportunities to improve skills beyond the role scope whilst also seeking regular feedback.

Encourages positive behaviours in others, while role modelling the Kainos values.',
# Senior Associate
   'Understands and confidently articulates own learning and developmental needs and proactively seek opportunities to gain experience.Has a strong level of self-awareness and in tune with own wellbeing needs and intuitive of others.

Seeks and responds positively to feedback regarding own learning and development. Approach with a willingness to take on tasks that are outside role scope.

Looks for opportunities to take on new challenges while proactively supporting and encouraging others in identifying learning needs.

Recognises inappropriate behaviours and challenges constructively while promoting the Kainos values. Adapting behaviours and acting in the most appropriate way to enable others to respond constructively.',
  
# Consultant
   'Understands own personal preferences, biases and values different cultures, backgrounds and circumstances in decision making and takes actions.Champions Kainos wellbeing offerings and provides direction to the various wellbeing guides and support available for our people.

Consistently sets own goals and manages this independently. Making autonomous decisions and are able to ‘get on with the job’ escalating decisions only when appropriate.

Identifies and addresses team or individual capability requirements and gaps to deliver current and future work. Consistently identifies and develops self and others to support talent development.

Demonstrates professional and organisational values through actions and behaviours. Behaves in an inclusive manner and respects equality and diversity.',
# Manager
	'Reflects on how factors such as own values, prejudices and emotions influences own judgement, behaviour, and self-belief. Uses feedback from appraisals and other sources to consider personal impact and changes behaviour. Understands personal sources of stress and wellbeing. 

Plans and manages own time effectively and fulfils work requirements and commitments to a high standard, without compromising own health and wellbeing. Remains calm and focused under pressure. 

Proactively manages self and career and identifies personal learning needs plan and completes a broad range of formal and informal learning opportunities by taking responsibility for own personal development and seeking opportunities for learning. Strives to put learning into practice. Clearly demonstrates that leadership and technical skills are equally valued.  

Behaves in an open, honest, and inclusive manner, upholding personal and organisational ethics and values. Shows respect for the needs of others and promotes equality and diversity. ',
# Principal
	'Uses sophisticated tools and sources to continuously learn about own leadership impact across the wider business community and improve personal effectiveness as a senior leader. Understands how pressures associated with carrying out a high-profile role impacts personally and own performance. 

Remains focused on the wider Kainos strategic goals when faced with competing and, at times, conflicting demands arising from differing priorities. 
Identifies where the need to personally get involved to achieve the most benefit for the wider organisation. 

Develops through systematically scanning the external environment and exploring leading edge thinking and best practice. Applies learning to build and refresh the business. Treats challenge as a positive force for improvement. 

Actively develops and protects Kainos through promoting and role modelling our values and competencies to achieve desired culture. Ensuring the business priorities maximise sustainability, equality, and diversity. '
   ),
   ('Working with Others', 
   # Apprentice
   'Understand how to respond constructively to developmental feedback from a diverse range of people and implement changes as a result.

Displays high levels of enthusiasm, energy and pace to achieve performance and results.

Recognises the need to build internal networks within immediate teams and projects. 

Respects others by attending meetings on time and contributing where appropriate. Recognising how current role relates to others within Capability and project.', 
	# Trainee
   'Shares learning with the team and other colleagues, contributing to the team’s understanding. 
 
Maintains consistent performance, challenging self and others to be positive and focused on achieving results, despite setbacks. Support others to work in a way that is mutually supportive.
 
Builds strong working relationships within team and project teams and start to consider building a wider network. 

Aware of the consequences of own behaviour and how this may affect others within the team. Supports the sharing of knowledge, information and learning with other colleagues. ',
    # Associate
   'Actively take opportunities to learn from a diverse range of people, to maximise performance and mentor/coach more junior colleagues. 

Is creative in finding ways to learn and personally improve results, suggesting new approaches to benefit self and the team. Review progress against goals making necessary adjustments to deliver successfully. 

Consistently collaborates within immediate teams and finds opportunities to build rapport and trust while supporting others.  Proactively contribute to the work of the whole team whilst building positive colleague relationships  
 
Actively participates and cooperates to support others within the team to achieve common goals. Able to interact effectively in stressful or frustrating 
situations, knowing when to step away for composure. ',
   # Senior Associate
   'Proactively supports the development of other team members while identifying opportunities to increase innovation to achieve team’s objectives. 

Encourages both formal and informal learning opportunities, ensuring others take responsibility for own learning and share this to increase organisational capability. Support and stretches self and others to deliver agreed goals and objectives. 

Effectively builds wider networks across projects, Capabilities and BUs and constructively challenges colleagues including those in positions of authority. 

Encourages collaborative team working within immediate teams and across the whole business. Supports an environment where others can make mistakes and learn from it. 
Open to giving and receiving honest feedback in order to highlight areas of improvement and recognise high performance. ',
   # Consultant
   'Support and empower team members through a range of activities to include coaching and mentoring. Demonstrate that leadership and technical skills are equally valued.
 
Role model continuous learning and self development, evaluating own effectiveness and growth. Motivate others to achieve through challenging times. Regularly monitor and discuss own and team’s performance expectations defined within 
the performance management system. 

Builds a strong network of collaborative relationships, in order to achieve objectives, whilst supporting wider stakeholder agendas. Recognised as an active mentor and coach and can demonstrate examples of  coaching others in immediate teams to improve performance. 

Encourages involvement from others to deliver through collaboration better results for Kainos. Recognises and builds on individual strengths of colleagues and team 
members while building relationships based on trust. Consistently publicise what the team members have achieved and give feedback and recognition awards where appropriate. 
',
   # Manager
	'Supports others in delivering high quality services and excellence by supporting mobilising teams and contributing to business improvement. 

Seeks and acknowledges the views and inputs of others. Shows respect for the contributions and challenges of others through positive and constructive feedback. 

Uses information and data about performance to identify improvements which will strengthen services. 

Identifies where working and cooperating with others can result in better services. Endeavours to work collaboratively. Communicates with and listens to others, recognising different perspectives. Empathises and considers the needs and feelings of others. Gains and maintains trust and support. 

Understands roles, responsibilities, and purpose within the team. Adopts a collaborative approach and respects team decisions. 
',
	# Principal
	'Removes barriers to preventing business improvement and innovation across Kainos. Drives innovation and diversity and enables inclusive environments while challenging and empowering others to lead. 

Improves company performance through engaging the company’s purpose both internally and externally. 

Promotes an inclusive culture that enables people to perform to their best, 
ensuring that appropriate performance management systems are in place and that performance data is systematically evaluated and fed into future plans. 

Takes a strategic and objective perspective to identifying potential and capability needs of Kainos, identifying and nurturing future leaders and innovators. 

Drives and delivers a culture that emphasises continuous improvement and effective team working relationships. Not afraid to lead in challenging times and make the hard decisions and communicate to the whole business with confidence and integrity. 
'),
   ('Setting Direction, Development and Accountability', 
   # Apprentice
   'Understands role, tasks and deadlines and work towards these, escalating any issues where appropriate to People/Project Manager. 

Accepts personal responsibility for quality and timelines of work set. 

Works to manage diary, commitments and ready to attend meetings on time. 

Actively supports new initiatives and tries different ways of doing things, learning from others’ experiences.', 
   # Trainee
   'Plans time effectively to ensure deadlines are met, and seen to be honest, escalating in advance any issues with completing tasks within the specified time. 

Takes ownership of all responsibilities within own role and honours commitments to others and to Kainos. 

Effectively manages diary, coming prepared for meetings and actively listen. 

Breaks down issues, and actively seeks further information and understanding. ',
    # Associate
   'Recognises how much time is required for different tasks and start to prioritise and communicate effectively within teams. Seeking appropriate support while supporting peers and junior team members. 

Identifies commitments and proactively seeks responsibility in delivering towards the wider team and project objectives. 

Establishes effective meetings through setting an agenda and coming prepared and speaking on projects calls where appropriate. Follows up and delivers upon actions from meetings.
 
Makes suggestions for improvements to personal work and processes.  
',
   # Senior Associate
   'A strong ability to multitask and prioritise to deadlines, overcoming obstacles to ensure the work is completed within time. Researching and communicating in advance any barriers that may affect projects. 

Demonstrates individual responsibility for achieving objectives and able to 
articulate success, failures and proposing remedial actions.
 
Consistently prepared for meetings and effectively manages own diary for preparation and an agenda is set in advance. Actively seeks input from colleagues and challenges others where appropriate. 

Processes and distils a variety of information to understand a problem fully while proposing options for solutions and building on the ideas of others. ',
   # Consultant
   'Develops effective systems to organise and track workload while, motivating and encouraging others to achieve planned results, delegating work to use people and resources to best effect. Ensuring colleagues are aware of any changing priorities and monitor progress. 

Delegates authority to match responsibilities and holds staff accountable for agreed-upon commitments. Within immediate teams creates accountability by using experience and advice to guide others. 

Sets an example of leading internal and external meetings through preparation, prioritisation, and considered agendas, ensuring any challenges and issues are discussed. 

Seeks the opinions and experiences of others to understand different approaches while thinking laterally about own work and encouraging creative problem solving.',
   # Manager
	'Understands the range of factors which determine why changes are made and supports Kainos senior leaders to deliver key messages. 

Gathers data and information about aspects of the business, analyses evidence and uses this knowledge to suggest changes that will improve services in the future. Questions established practices which do not add value. Puts forward creative suggestions to improve the quality of service provided. 

Consults with others and contributes to decisions including the future direction/vision of own business area or projects. 

Assesses the effects of change on service delivery and customer outcomes. Makes recommendations for future improvements. 
',
	# Principal
	'Develops an in-depth insight into the dynamics and issues surrounding Kainos including political, economic, social, environmental, technological, and legal impacts. Fully understands the impact of change on organisation culture and proactively seeks feedback and ideas from employees and stakeholders while also empowering leaders. 

Creates an environment that fosters knowledge sharing and innovation, demonstrating the courage to take risks to enable significant improvements and empowering others to do so where appropriate. Creates a culture of flexibility and responsiveness, mobilising Kainos to respond quickly to changing priorities. 

Fully engages and utilises external experts wider experience and knowledge to support strategic decision making. Navigates and balances external pressures while empowering leaders and principals to shape Kainos strategy and business priorities.  

Creates a culture of transparency and honesty when it comes to evaluating impact challenges and successes. Fostering an ethos of one Kainos. Scanning the broad internal and external environment and taking account of wider impact to develop long term implementation strategies that maximise opportunities to add value to customers and support sustainable growth. '),
   ('Supporting and Delivering the Strategy', 
   #Apprentice
	'Understands the Kainos Vision, Strategy and Principles.

	Understands the organisation structure and the purpose of Kainos.

	Possess general knowledge of local cultural differences and familiar with the Kainos policy towards Diversity and Inclusion.',
	#Trainee
   'Recognises how to contribute to the wider organisational objectives and strategic principles. Articulates. Individual contribution to the wider Kainos objectives and uses.

	Pays attention to organisational information, how well we are doing and what is changing.

	Awareness of cultural differences and willingness to develop and grow understanding of global and cultural effectiveness.',
   #Associate
   'Articulates individual contribution to the wider Kainos objectives and uses evidence by including SMART goals that align to the Capability/BU.

	Clearly defines how individual personal performance can have an impact on the business achieving the vision and objectives.

	Respects differences and promotes inclusion on a transactional level. Displays appropriate ethical behaviours and acknowledges own unconscious bias.',
   #Senior Associate
   'Supports peers and team members in understanding the wider Kainos objectives and how we all have a role in Kainos’ success.

	Recognises and reflects on how personal actions may have a wider impact on other people and teams.

	Demonstrates awareness and appreciation for the global multi-dimensional and diverse perspectives of our people. Provide a protective environment within immediate teams in which colleagues can escalate any issues while demonstrating impartial application of Kainos policies, procedure and practices.',
   #Consultant
   'Balances own teams needs with wider organisational needs while translating the Vision and Strategy into practical and tangible goals.

	Effectively ensures immediate teams understand how their work contributes to and delivers organisational priorities.

	Consistently role models cultural effectiveness in the demonstration of ethical behaviours while understanding the value diversity brings to Kainos. Promoting diversity and inclusion within teams while adapting to the needs of our diverse people.',
   #Manager
   'Strategic awareness including an understanding and knowledge of how role and those within in immediate team fit with and support delivery of the organisational objectives.

	Feeds in ideas and knowledge from immediate teams and supports the senior leaders in developing a strategy.

	Support, develop and implement the strategy in immediate teams. 

	Passionately advocates the strategy and vision and translates this into action and opportunities within immediate teams. Understands the need for OKR’s/KPI’s and own role in supporting and shaping in relation to immediate teams.',
   #Executive
   'Sets, maintains, and ensures a clear direction for Kainos with highly focused priorities and results by articulating short, medium-and long-term strategies focused on adding real value to Kainos and our customers

	Creates joined up strategies and plans which help put into practice and support Kainos vision and long-term direction which are challenging yet achievable. Based upon external economic, social, technology and environmental trends.

	Enables the whole company to remain focused on business priorities, irrespective of challenges. Swiftly refocuses Kainos on new priorities as changing situations dictate. Models personal resilience and accountability for achieving strategic priorities and results. Balances challenging operational and strategic priorities.

	Establishes transparency and trust where results are discussed openly. Encourages and inspires the organisation to energise delivery, while driving a performance culture across Kainos and achieve results through others. Monitors and evaluates strategic outcomes, adjusting to ensure sustainability of the strategy and ongoing communication and engagement.'),
   ('Commerciality and Risk', 
	#Apprentice
	'Understands the Kainos Vision, Strategy and Principles.

	Understands the organisation structure and the purpose of Kainos.

	Possess general knowledge of local cultural differences and familiar with the Kainos policy towards Diversity and Inclusion.',
	#Trainee
   'Recognises how to contribute to the wider organisational objectives and strategic principles.

	Pays attention to organisational information, how well we are doing and what is changing.

	Awareness of cultural differences and willingness to develop and grow understanding of global and cultural effectiveness.',
   #Associate
   'Articulates individual contribution to the wider Kainos objectives and uses evidence by including SMART goals that align to the Capability/BU.

	Clearly defines how individual personal performance can have an impact on the business achieving the vision and objectives.

	Respects differences and promotes inclusion on a transactional level. Displays appropriate ethical behaviours and acknowledges own unconscious bias.',
   #Senior Associate
   'Supports peers and team members in understanding the wider Kainos objectives and how we all have a role in Kainos’ success.

	Recognises and reflects on how personal actions may have a wider impact on other people and teams.

	Demonstrates awareness and appreciation for the global multi-dimensional and diverse perspectives of our people. Provide a protective environment within immediate teams in which colleagues can escalate any issues while demonstrating impartial application of Kainos policies, procedure and practices.',
   #Consultant
   'Balances own teams needs with wider organisational needs while translating the Vision and Strategy into practical and tangible goals.

	Effectively ensures immediate teams understand how their work contributes to and delivers organisational priorities.

	Consistently role models cultural effectiveness in the demonstration of ethical behaviours while understanding the value diversity brings to Kainos. Promoting diversity and inclusion within teams while adapting to the needs of our diverse people.',
   #Manager
   'Aware of the importance of effective commercial behaviours and the needs of the business. Identifies and ensures that personal objectives are focussed on innovative solutions to achieve commercial outcomes and objectives as well as contributing to our growth ambitions. Recognises when products or services are not being  delivered to the required level of quality or standard and takes appropriate action. 

	Contributes to development of new business through involvement in BD process, for example, bid/proposal writing, customer presentations, pricing solutions. Establishes trusted customer relationships and adds value by helping and advising customers in areas beyond current project work, identifying possible areas where additional Kainos business can be generated.

	Looks to support and drive efficiencies and profitability through immediate team. Reviews processes within own teams and challenges through the right behaviours and channels to support the overall commercial objectives. 

	Understands and protects Kainos from risks associated with contractual commitments. Takes a balanced risk and reward view to activities and commitments while managing quality and Kainos interests. 

	Supports and aligns to Kainos policies and processes escalating or challenging where appropriate. Ensures compliance across own team.',
   #Executive
   'Role models leadership, influencing and accountability in relation to commerciality and risks to create and deliver the corporate plan. Creates and embeds a culture of commercial awareness and solid business acumen, ensuring that all employees understand the commercial environment in which we operate and can pro- actively play a part in delivering change, efficiency and growth. 

	Role model for others to follow. Inspires staff across the whole organisation to contribute to BD and celebrate its success. Champions BD, promoting Kainos at levels including internal ‘all hands’, partners, investors, customers and senior figureheads within regions. Takes responsibility for strategic investment decisions, for example, acquisitions, new markets, new regions.

	Draws on insights of current and future marketplace dynamics to seize opportunities to stimulate sustainable growth. Drives and delivers a continuous pipeline of innovation through our business models, products, and services ensuring sustainable commercial growth. 

	Makes and encourages strategic investment decisions, challenging to ensure appropriate levels of expenditure and maximise return. Demonstrates transparency both in terms of key investment decisions and appropriate use of resources. Initiates and build strategic commercial relationships with the shareholder, partners, customers, and competitors to deliver results. 

	Sets clear direction against all processes and policies and ensures we continue to develop and adapt to the ever-evolving risks and changes to the needs of the whole business.'
),
   ('Communicating and Influence',
   #Apprentice
   'Acts in a respectful manner in all forms of communication while being open and honest. Displays a positive approach when interacting with others.

	Recognises influencing as a key skill required to work effectively with internal and external customers.

	Acts in accordance with the Kainos values demonstrating through own behaviours and interactions with colleagues and customers.', 
    #Trainee
   'Communicates own views in a clear and constructive manner, while listening to different views and considers all employees from various backgrounds.

	Observes team/colleagues influencing internally and externally and understands the benefits of adapting personal style to shape, motivate and influence effectively.

	Understands who our customers are and what problems the team is trying to solve.',
   #Associate
   'Involved at meetings, asking questions, listening and develops and presents a well-reasoned point of view. Remaining communicative and clear in own thoughts and ideas when approached by others, giving consideration to the communication needs of other staff and customers.

	Demonstrates influencing skills internally and able to communicate points clearly and open to feedback from others.

	Demonstrates how to participate in stakeholder management, escalates effectively, and strives to provide a quality service and showcase Kainos positively.',
   #Senior Associate
   'Recognises and respect that communication is a two-way process and demonstrate effective questioning and active listening skills to achieve this. Confidently handles challenging conversations and is clear and constructive in response.

	Persuades and influences with sound rationale argument ‘appealing to others’ interest or reason to gain support.

	Authentic in stakeholder relationships and take pride in being inclusive and trustworthy while keeping promises made with customers. Responds honestly and promptly to customer requests and whenever possible within agreed timeframes.',
   #Consultant
   'Uses communication to create a shared sense of purpose and direction. Adapting own style to effectively communicate and able to demonstrate this when difficult conversations have a positive outcome.

	Acts as an influential and effective member of multi-disciplinary teams or projects. Initiates collaboration and actively encourages people to cooperate in initiatives where they can add value.

	Assesses customer needs accurately by listening and applying sensitive questioning. Managing customer expectations in relation to scope of work and are honest in what can and cannot be achieved within timescales. Confident in negotiating with customers to reflect changes in scope of work.',
   #Manager
   'Provides feedback and support in communicating the vision, and advocates within immediate teams.

	Credible communicator, displaying authenticity and adapting influencing style for different audiences.

	Articulates the need for changes to processes and systems, acknowledging the impact on people and services.

	Applies and adapts various approaches to stakeholder management through influencing and negotiating to maximise business for Kainos by developing and maintaining internal and external networks.',
   #Executive
   'Actively engages key stakeholders in creating a bold, innovative, shared vision which reflects the future needs and aspirations of the whole company and the future direction of Kainos. Thinks broadly and aligns the vision to the Kainos values and communicates gaining buy in.

	Takes action to shape and implement a vision for the future of Kainos and our customers while sharing leadership and empowering others to contribute and collaborate.

	Empowers senior leaders within Kainos to drive change and transformation while providing direction and creating a collaborative environment for sustained change.

	Builds a strong network of collaborative relationships and partnerships globally to achieve our objectives, whist supporting wider stakeholder agendas. Utilises the experience and input of external partners, non-executive directors, and industry experts to improve effectiveness.')
;

# populate training table

INSERT INTO training (training_id, training, sharepoint_url)
   VALUES (1, 'Mindset Module', 'https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Mindset.aspx'), # all bands
   (2, 'Hybrid Working – A guide to working remotely', 'https://kainos.talentlms.com/learner/courseinfo/id:275'), # all bands
   (3, 'Effective Time Management', 'https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Time-Management.aspx'), # 7-3
   (4, 'Train The Trainer', 'https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Train-The-Trainer.aspx'), #  Associate Level Plus 
   (5, 'Having Courageous Conversations', 'https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Crucial-Conversations.aspx'), #Senior Associates Plus
   (6,'Leading Change','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Leading-Change.aspx'), #Principal to Leader
   (7,'Managing Change','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Managing-Change.aspx'), #Consultant to Manager
   (8,'Effective Decision Making ','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Effective-Decision-Making.aspx'); #Consultant to Leader Bands

# connecting table for training to band as a band can have many training and a training can have many bands
   
INSERT INTO training_bands (training_id, band_id)
   VALUES
   (1,1),
   (1,2),
   (1,3),
   (1,4),
   (1,5),
   (1,6),
   (1,7),
   (2,1),
   (2,2),
   (2,3),
   (2,4),
   (2,5),
   (2,6),
   (2,7),
   (3,3),
   (3,4),
   (3,5),
   (3,6),
   (3,7),
   (4,1),
   (4,2),
   (4,3),
   (4,4),
   (4,5),
   (5,1),
   (5,2),
   (5,3),
   (5,4),
   (6,1),
   (7,2),
   (7,3),
   (5,1),
   (8,2),
   (8,3)
 ;
