{include $theme['head']}  

{include $theme['navbar']}  

{include $theme['staf-sidebar']} 

  

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    {include $theme['breadcrump']} 

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">

     		
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="card">
							
							<div class="card-body">
								<h4 class="header-title">List Pendampingan</h4>
								<br>
								<!-- card tools -->
								<div class="card-tools" style="display: none">
								  
								</div>
								<div class="table-responsive mt-3">
									<table id="datatable" class="table table-bordered table-striped">
										<thead>
											<tr>
                                                <th>Account</th>
                                                <th>Trend count</th>
                                                <th>Start date</th>
												<th>End date</th>
                                                <th>Status</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody id="ListTrade">
										{if count($cust) > 0}										
                                            {foreach from=$cust item=p key="key"}
                                            <tr id="tr{$p['user_id']}">
                                                <td><span style="display: none;">{$p['name']} {$p['phone']} {$p['email']}</span>{if $p['account_id'] != ''}{$p['account_id']} <a href="javascript:void(0)" onClick="copyTextToClipboard('{$p['account_id']}')">Copy</a> <br/>{/if}
                                                    {$p['name']} <br/> <a href="https://n.gass.co.id/cust/{$p['phone']}" target="_blank">{$p['phone']}</a></td>
                                                <td>{$p['trend_count']}</td>
                                                <td>{$p['start_date']}</td>
                                                <td>{$p['end_date']}</td>
                                                <td>
                                                  <select class="form-control" onChange="ganti_status(this, {$p['user_id']})" id="status{$p['user_id']}">
                                                    <option value="" {if $p['status_pendampingan'] ==' '}selected{/if}> </option>
                                                    <option value="FU 1" {if $p['status_pendampingan'] =='FU 1'}selected{/if}>FU 1</option>
													<option value="FU 2" {if $p['status_pendampingan'] =='FU 2'}selected{/if}>FU 2</option>
													<option value="FU 3" {if $p['status_pendampingan'] =='FU 3'}selected{/if}>FU 3</option>
                                                    <option value="FU 4" {if $p['status_pendampingan'] =='FU 4'}selected{/if}>FU 4</option>
                                                    <option value="FU 5" {if $p['status_pendampingan'] =='FU 5'}selected{/if}>FU 5</option>
                                                  </select>
                                                </td> 
                                                <td>
                                                     <button class="btn btn-success" type="button" onClick="pick_task('{$p['user_id']}','{$p['account_id']}', '{$p['phone']}', '{$p['email']}', '{$p['name']}', '{$p['trend_count']}')">Pick Task</button>
                                                </td>
                                                <textarea id="json{$p['user_id']}" style="display:none">{$p|@json_encode}</textarea>
                                            </tr>
                                            {/foreach} 
										{/if}
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end row -->

      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<div class="modal fade" id="frmADD">
  <div class="modal-dialog">
	<div class="modal-content">

	  <!-- Modal Header -->
	  <div class="modal-header">
		<h4 class="modal-title">Tambah</h4>
		<button type="button" class="close" data-dismiss="modal">&times;</button>
	  </div>
	  <!-- Modal body -->
	  <div class="modal-body">
		<div class="row">  
			<div class="col-md-12">
				<div class="form-group label-floating is-empty">
					<label class="control-label">Name</label>
					<input class="form-control" type="text" placeholder="Enter Name" name="name" id="name">
				<span class="material-input"></span></div>
			</div> 
            <div class="col-md-12">
				<div class="form-group label-floating is-empty">
					<label class="control-label">Phone</label>
					<input class="form-control" type="tel" placeholder="Enter phone" name="phone" id="phone">
				<span class="material-input"></span></div>
			</div>
            <div class="col-md-12">
				<div class="form-group label-floating is-empty">
					<label class="control-label">Email</label>
					<input class="form-control" type="email" placeholder="Enter email" name="email" id="email">
				<span class="material-input"></span></div>
			</div>
		</div>
	  </div>

	  <!-- Modal footer -->
	  <div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
		<button class="btn btn-primary" onclick="simpan()">Simpan</button>
	  </div>

	</div>
  </div>
</div>

{include $theme['footer']}  
{literal}
<script>
  $(function () {

  })
  $( document ).ready(function() {
		
	});
  function clearform(){
      $("#code").val('');
  }
  
  function ganti_status(tg, id){
    var json =  JSON.parse($('#json'+id).val());
    waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'ganti_status', 'user_id' : id, status: $(tg).val()},
		dataType: "json",
		success: function(e) { 	
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			if( e.code == 1){
                json.status_pendampingan = $(tg).val();
                $('#json'+id).val(JSON.stringify(json));
				openmsg(e.msg, "success");						
			}else{
				openmsg(e.msg, 'error');
			}
		},error: function() {
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');				
		}
	})
  }
  function pick_task(user_id, account_id, phone, email, name, trend_count){
    $.ajax({
        type: "POST",
        url: '{/literal}{$app->fullpath}{literal}',
        data: {act:'pick_task', 'user_id' : user_id, 'account_id' : account_id, 'phone' : phone, 'email' : email, 'name' : name, 'trend_count': trend_count},
        dataType: "json",
        success: function(e) { 	
//			setTimeout(function(){
//				waitingDialog.hide();
//			}, 2000);	
            if( e.code == 1){
                $('#tr'+user_id).remove();
                openmsg(e.msg, "success");						
            }else{
                openmsg(e.msg, 'error');
            }
        },error: function() {
//			setTimeout(function(){
//				waitingDialog.hide();
//			}, 2000);	
            openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');				
        }
    })
  }

    
  function simpan(){
	$("#frmAddINOUT").modal('hide');
	waitingDialog.show('Loading..');
	var dt = {act:'add', code: $("#code").val()};
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: dt,
		dataType: "json",
		success: function(e) {
			setTimeout(function(){
				waitingDialog.hide();
			}, 2000);			
			if(e.code==1){
				openmsg(e.msg, 'success');
				setTimeout(function () {
				  window.location.href = window.document.URL;
				}, 2000);
			}else{
				openmsg(e.msg, 'error');
				$("#frmAddINOUT").modal('show');
			}						
		},error: function() {
			$("#frmAddINOUT").modal('show');
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');
			setTimeout(function(){
				waitingDialog.hide();
			}, 2000);
		}
	});
}
    
function openmsg(msg, tipe){
	const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 2500
    });
	Toast.fire({
        icon: tipe,
        title: msg
      })
}
    
function copyTextToClipboard(text) {
  navigator.clipboard.writeText(text).then(function() {
      openmsg('Text copied to clipboard', 'success');
  }).catch(function(error) {
      openmsg('Error copying text: '+error, 'error');
  });
}
    
var dtIntegration = function() {
	$.extend(true, $.fn.dataTable.defaults, {
		"sDom": "<'row'<'col-sm-6 col-xs-5'l><'col-sm-6 col-xs-7'f>r>t<'row'<'col-sm-5 hidden-xs'i><'col-sm-7 col-xs-12 clearfix'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_",
			"sSearch": "<div class=\"input-group\">_INPUT_<span class=\"input-group-addon\"><i class=\"fa fa-search\"></i></span></div>",
			"sInfo": "<strong>_START_</strong>-<strong>_END_</strong> of <strong>_TOTAL_</strong>",
			"oPaginate": {
				"sPrevious": "",
				"sNext": ""
			}
		}
	});
	$.extend($.fn.dataTableExt.oStdClasses, {
		"sWrapper": "dataTables_wrapper form-inline",
		"sFilterInput": "form-control",
		"sLengthSelect": "form-control"
	});
};
  $(function () {
    $('#datatable').DataTable({
      "responsive": true,
      "autoWidth": false,
        "order": [[0, "desc" ]]
    });
  });
</script>
{/literal}