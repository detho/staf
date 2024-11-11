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
								<h4 class="header-title">Customer Support</h4>
								<br>
								<!-- card tools -->
								<div class="card-tools" style="display: none">
								  <button type="button" class="btn btn-primary btn-sm" data-toggle="tooltip" onClick="clearform();$('#frmADD').modal('show');">
									<i class="fas fa-plus"></i> Tambah
								  </button>
								</div>
								<div class="table-responsive mt-3">
									<table id="datatable" class="table table-bordered table-striped">
										<thead>
											<tr>
                                                <th>Tanggal</th>
                                                <th>Account</th>
                                                <th>CTA</th>
                                                <th>type</th>
												<th>Sudah install</th>
                                                <th>Fixed Error</th>
												<th>Fu Date</th>
												<th>Status</th>
                                                {if $profile['role']==99}<th>Date Note</th>{/if}
												<th>Note</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody id="ListTrade">
										{if count($cust['data']) > 0}										
										{foreach from=$cust['data'] item=p key="key"}
										<tr id="tr{$p['id']}">
                                            <td><b>Tanggal Order </b><br/>{$p['date_order']}<br/><br/><b>Tanggal Add </b><br/>{$p['date_support']}</td>
                                            <td>{$p['account_id']} <a href="javascript:void(0)" onClick="copyTextToClipboard('{$p['account_id']}')">Copy</a>
                                                <br/> {$p['name']} <br/> <a href="https://n.gass.co.id/cust/{$p['id']}" target="_blank">{$p['phone']}</a></td>
                                            <td>{$p['total_cta']}</td>
                                            <td>{$p['type_support']}</td>
									  	    <td>
                                                <div class="form-check" onClick="ganti_install({$p['id']})">
                                                      <input class="form-check-minat{$p['id']}" type="checkbox" value="" id="install{$p['id']}" {if $p['sudah_install']==1}checked{/if} >
                                                      <label class="form-check-minat{$p['id']}" for="minat{$p['id']}">
                                                        Sudah Install
                                                      </label>  
                                                    </div>
                                            </td> 
                                            <td>
                                                <div class="form-check" onClick="ganti_fixed({$p['id']})">
                                                      <input class="form-check-minat{$p['id']}" type="checkbox" value="" id="fix{$p['id']}" {if $p['fixed_error']==1}checked{/if} >
                                                      <label class="form-check-minat{$p['id']}" for="minat{$p['id']}">
                                                        Fixed error
                                                      </label>  
                                                </div>
                                            </td>

											<td>
												{$p["fu_support"]}
											</td>

											<td>
                                                  <select class="form-control" onChange="ganti_alasan_support(this, {$p['id']})" id="alasan_support{$p['id']}">
                                                    <option value="" {if $p['alasan_support'] ==' '}selected{/if}> </option>
                                                    <option value="No Response 1" {if $p['alasan_support'] =='No Response 1'}selected{/if}>No Response 1</option>
													<option value="No Response 2" {if $p['alasan_support'] =='No Response 2'}selected{/if}>No Response 2</option>
													<option value="No Response 3" {if $p['alasan_support'] =='No Response 2'}selected{/if}>No Response 3</option>
                                                    <option value="Belum Butuh" {if $p['alasan_support'] =='Belum Butuh'}selected{/if}>Belum Butuh</option>
                                                    <option value="Refund" {if $p['alasan_support'] =='Refund'}selected{/if}>Refund</option>
                                                    <option value="Normal" {if $p['alasan_support'] =='Normal'}selected{/if}>Normal</option>
													<option value="Monitor" {if $p['alasan_support'] =='Monitor'}selected{/if}>Monitor</option>
                                                    <option value="Stay V1" {if $p['alasan_support'] =='Stay V1'}selected{/if}>Stay V1</option>
                                                  </select>
                                             </td>
                                            {if $profile['role']==99}<th>{$p['date_note']}</th>{/if}
											<td>
                                                <div class="form-check" >
                                                      <textarea id="support_note_{$p['id']}">{$p['note_support']}</textarea> <br/>
													  <input type="button" name="save" value="save" onClick="save_note_support({$p['id']})" />
                                                </div>
                                            </td>
                                            <td>
                                                 <button class="btn btn-success" type="button" onClick="hide_support('{$p['id']}')">Done</button>	
                                                 <button class="btn btn-info" type="button" onClick="view_log('{$p['id']}')">Activity</button>	
                                             </td>
											  <textarea id="json{$p['id']}" style="display:none">{$p|@json_encode}</textarea>
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

  function hide_support(id){
    var save_done = false;
    var fix  = document.getElementById("fix"+id);
    var json =  JSON.parse($('#json'+id).val());
    if(json.type_support == "error" && fix.checked){
        save_done = true;
    }else if($('#alasan_support'+id).val() == 'No Response 3' || $('#alasan_support'+id).val() == 'Refund' || $('#alasan_support'+id).val() == 'Belum Butuh'){
        save_done = true;
    }else if(json.total_cta > 100 && $('#alasan_support'+id).val() == 'Normal' || $('#alasan_support'+id).val() == 'Monitor' || $('#alasan_support'+id).val() == 'No Response 3'){
        save_done = true;
    }
    //waitingDialog.show('Loading..');
    if(save_done==true){
        $.ajax({
            type: "POST",
            url: '{/literal}{$app->fullpath}{literal}',
            data: {act:'hide_support', 'id' : id},
            dataType: "json",
            success: function(e) { 	
    //			setTimeout(function(){
    //				waitingDialog.hide();
    //			}, 2000);	
                if( e.code == 1){
                    $('#tr'+id).remove();
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
    }else{
        openmsg('Syarat belum memenuhi', 'error');	
    }
    
  }
  function view_log(id){
      $("#activity").html('');
      $.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'view_log', 'id' : id},
		dataType: "json",
		success: function(e) { 		
			if( e.code == 1){
				$.each(e.data, function(key, val) {             
                    $("#activity").append('<div class="mb-1"><span>['+val.waktu+'] <br> <i>'+val.keterangan+'</i></span></div>');  
                }); 	
                $("#nav-toggle-button").ControlSidebar('toggle');
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
    
  function ganti_alasan_support(tg, id){
    //waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'ganti_alasan_support', 'id' : id, alasan: $(tg).val()},
		dataType: "json",
		success: function(e) { 	
//			setTimeout(function(){
//				waitingDialog.hide();
//			}, 2000);	
			if( e.code == 1){
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

  function ganti_install(id){
    //waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'ganti_install', 'id' : id},
		dataType: "json",
		success: function(e) { 	
//			setTimeout(function(){
//				waitingDialog.hide();
//			}, 2000);	
			if( e.code == 1){
                //$('#tr'+id).remove();
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

  function ganti_fixed(id){
    //waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'ganti_fixed', 'id' : id},
		dataType: "json",
		success: function(e) { 	
//			setTimeout(function(){
//				waitingDialog.hide();
//			}, 2000);	
			if( e.code == 1){
                //$('#tr'+id).remove();
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

  function save_note_support(id){
    //waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'save_note_support', 'id' : id , 'support_note' : $("#support_note_"+id).val()},
		dataType: "json",
		success: function(e) { 	
//			setTimeout(function(){
//				waitingDialog.hide();
//			}, 2000);	
			if( e.code == 1){
                //$('#tr'+id).remove();
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